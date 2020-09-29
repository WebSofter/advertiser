<template>
  <div>
    <div>
      <Breadcrumbs v-if="viewMode == 'page'" />
    </div>
    <b-card :title="taskName" class="main-card mb-4">
      <v-card-text v-if="noteList.length < 1">
        <div class="widget-content-center">
          <div class="widget-subheading opacity-10">
            <h3 class="text-center">
              No have any note
            </h3>
          </div>
        </div>
      </v-card-text>
      <b-row>
        <b-col lg="6" class="my-1"></b-col>
        <b-col lg="4" class="my-1 dynamic-tables__search"></b-col>
        <b-col lg="2" class="my-1 dynamic-tables__search"></b-col>
      </b-row>
      <b-row>
        <b-col lg="12" md="12" class="my-1 space-between">
            <div class="main-card mb-3 card w-100">


              <!-- Пагинация с кнопками -->
              <b-row>
                <b-col lg="12" class="my-1 w-100" text="center">
                  <div class="overflow-auto">
                    <!--:style="{visibility: navItems.length > 1 ? 'visible' : 'hidden'}"-->
                    <div class="text-center w-100 d-block">
                      <!--:number-of-pages="navItems.length"-->
                      <!--
                      <b-pagination-nav 
                        pills size="sm" 
                        v-model="currentPageNav"
                        :pages="navItems" 
                        use-router
                        @input="changePage"
                        class="d-inline-flex"
                        >
                      </b-pagination-nav>
                      -->
                      <!--<p>Current Page: {{ currentPageNav }}</p>-->
                    </div>
                  </div>
                </b-col>
              </b-row>

              <!-- Пагинация по Ajax -->

              <b-nav element="#infinite_content" slot="header" v-b-scrollspy:infinite_content_note>
                <b-nav-item v-for="(navItem, $index) in navItems" :key="$index" :href="navItem.link" @click="scrollIntoView">
                  {{ navItem.page }}
                </b-nav-item>
              </b-nav>




              <ul class="list-group list-group-flush infinite_content_note" :ref="'infinite_content'" id="infinite_content_note" style="overflow-y:scroll;max-height:700px;position:relative;">
              <!--
                <li v-for="note in noteList" :key="note.id" class="list-group-item">
                  <div class="widget-content p-0">
                    <div class="widget-content-wrapper">
                      <div class="widget-content-left mr-3">
                        <div class="widget-content-left">
                          <img width="42" class="rounded" src="@/assets/images/avatars/user_pic_male.png" alt />
                        </div>
                      </div>
                      <div class="widget-content-left flex2">
                        <div class="widget-subheading opacity-10">
                          <div v-html="note.description"/>
                        </div>
                      </div>
                    </div>
                    <div class="d-flex">
                      <b-list-group horizontal v-for="(f, index) in note.files" :key="index" class="d-contents">
                        <b-list-group-item class="border-0">
                          <div class="widget-content p-0">
                            <div class="widget-content-wrapper">
                              <div class="widget-content-left opacity-6 fsize-2 mr-3 center-elem" :class="f.file.color">
                                <font-awesome-icon :icon="f.file.icon" />
                              </div>
                              <div class="widget-content-left">
                                <div class="widget-heading font-weight-normal">{{ fileNameLimit(f.file.name)}}</div>
                              </div>
                              <div class="widget-content-right widget-content-actions">
                                <button class="btn-icon btn-icon-only btn btn-link btn-sm" @click="downloadFile(f.file)">
                                  <font-awesome-icon icon="cloud-download-alt" />
                                </button>
                              </div>
                            </div>
                          </div>
                        </b-list-group-item>
                      </b-list-group>
                    </div>
                  </div>
                </li>
              -->
                      <li v-for="(n, index) in noteList" :key="'note_' + taskId + '_' + index" @dblclick="editNote($event, taskId, n)" class="list-group-item border" :ref="'note_message_' + n.id" :id="n.hasOwnProperty('page') ? ('page-' + n.page) : ''">
                        <div class="widget-content p-0 ">
                          <div class="widget-content-wrapper">
                            <div class="widget-content-left mr-3">
                              <img  width="42" class="rounded-circle" src="@/assets/images/avatars/user_pic_male.png" alt />
                            </div>
                            <div class="widget-content-left ">
                              <div class="widget-heading text-danger">{{ n.username }}</div> 
                              <div class="widget-heading" :contenteditable="false" :ref="'note_title_' + n.id" :id="'note_title_' + n.id" >{{ n.title }}</div>
                              <div class="widget-subheading" :contenteditable="false" :ref="'note_description_' + n.id" :id="'note_description_' + n.id" v-html="n.description"></div>
                              <small class="opacity-6">
                                <font-awesome-icon icon="calendar-alt" class="mr-1" /> {{n.date_start}}
                              </small>
                            </div>
                            <div class="widget-content-right">
                              <div class="widget-numbers text-primary">
                                <span class="count-up-wrapper"></span>
                                <button :ref="'btn_note_save_' + n.id" class="border-0 btn-transition btn btn-outline-success d-none"  @click="editNote($event, taskId, n, 'save')">
                                  <font-awesome-icon icon="check" />
                                </button>
                                <button :ref="'btn_note_edit_' + n.id" @click="editNote($event, taskId, n)" class="border-0 btn-transition btn btn-outline-success">
                                  <i class="pe-7s-note cursor-pointer"></i>
                                </button>
                                <button @click="delNote(taskId, n.id)" class="border-0 btn-transition btn btn-outline-danger">
                                  <font-awesome-icon icon="trash-alt" />
                                </button>
                              </div>
                            </div>
                          </div>
                        </div>
                        <div class="w-100 d-flex">
                          <vue-dropzone class="d-none" :ref="'dropzone_' + taskId + '_' + n.id" :id="'dropzone_' + taskId + '_' + n.id" 
                          @vdropzone-complete="afterCompleteUploadFileNote($event, task, n)"
                          :options="dropzoneOptionsNote"></vue-dropzone>
                        </div>
                        <div class="d-flex">
                          <b-list-group horizontal v-for="(f, index) in n.files" :key="'file_' + taskId + '_' + n.id + '_' + index" class="d-contents">
                            <b-list-group-item class="border-0">
                              <div class="widget-content p-0">
                                <div class="widget-content-wrapper">
                                  <div class="widget-content-left opacity-6 fsize-2 mr-3 center-elem" :class="f.file.color">
                                    <font-awesome-icon :icon="f.file.icon" />
                                  </div>
                                  <div class="widget-content-left">
                                    <div class="widget-heading font-weight-normal" :class="f.status == 1 ? '' : 'text-removed'">{{ fileNameLimit(f.file.name)}}</div>
                                  </div>
                                  <div class="widget-content-right widget-content-actions">
                                    <button class="btn-icon btn-icon-only btn btn-link btn-sm" @click="downloadFile(f.file)">
                                      <font-awesome-icon icon="cloud-download-alt" />
                                    </button>
                                  </div>
                                  <button :ref="'btn_file_delete_' + n.id" class="btn-icon btn-icon-only btn-danger btn btn-link btn-sm" :class="f.hasOwnProperty('new')? '': 'd-none'" @click="delFile(task, n, f)">
                                      <font-awesome-icon :icon="f.status == 1 ? 'minus-circle' : 'trash-restore'" />
                                  </button>
                                </div>
                              </div>
                            </b-list-group-item>
                          </b-list-group>
                        </div>
                      </li>
                <infinite-loading direction="top" spinner="spiral" force-use-infinite-wrapper="#infinite_content_note" @infinite="infiniteHandler">
                  <div slot="spinner">Loading...</div>
                  <div slot="no-more"></div>
                  <div slot="no-results">No results content</div>
                </infinite-loading>
              </ul>

              <b-card>
                <ul>
                  <li v-for="(error, index) in noteErrors" :key="index" class="text-danger">{{ error }}</li>
                </ul>
                <div>
                  <b-form-group :label-for="'editor-sm-' + taskId">
                    <editor  placeholder="Description..."  class="editor" v-model="noteDescription" height="100px" :id="'editor-sm-' + taskId"/>
                  </b-form-group>
                </div>
                <div class="w-100 d-flex">
                  <vue-dropzone :ref="'dropzone_' + taskId" :id="'dropzone_' + taskId" 
                  @vdropzone-complete="afterCompleteUploadFile"
                  :options="dropzoneOptions"></vue-dropzone>
                </div>
                <template v-slot:footer>
                  <b-list-group horizontal style="" v-for="(file, index) in noteFiles" :key="index">
                    <b-list-group-item class="border-0">
                      <div class="widget-content p-0">
                        <div class="widget-content-wrapper">
                          <div class="widget-content-left opacity-6 fsize-2 mr-3 center-elem" :class="file.color">
                            <font-awesome-icon :icon="file.icon" />
                          </div>
                          <div class="widget-content-left">
                            <div class="widget-heading font-weight-normal">{{file.name}}</div>
                          </div>
                          <div class="widget-content-right widget-content-actions">
                            <button class="btn-icon btn-icon-only btn btn-link btn-sm" @click="downloadFile(file)">
                              <font-awesome-icon icon="cloud-download-alt" />
                            </button>
                          </div>
                        </div>
                      </div>
                    </b-list-group-item>
                  </b-list-group>
                </template>
                <b-button block variant="primary" class="mt-1" @click="addNote(taskId)">Add note</b-button>
              </b-card>

            </div>
        </b-col>
      </b-row>
    </b-card>
  </div>
</template>

<script>
import conf from '../configuration'
import util from '../util'
import Breadcrumbs from "../components/Breadcrumbs"
import { mapGetters, mapActions } from "vuex"
import vSelect from "vue-select"
import ICountUp from "vue-countup-v2"
import VueCircle from "vue2-circle-progress"
import { library } from "@fortawesome/fontawesome-svg-core"
import { faStar, faPlus, faTrashAlt, faCheck, faEdit, faFileImage, faFileVideo, faFileWord, faTasks, faMinusCircle, faTrashRestore, faExternalLinkAlt } from "@fortawesome/free-solid-svg-icons"
import { FontAwesomeIcon } from "@fortawesome/vue-fontawesome"
library.add(faStar, faPlus, faTrashAlt, faCheck, faEdit, faFileImage, faFileVideo, faFileWord, faTasks, faMinusCircle, faTrashRestore, faExternalLinkAlt)

import { VueEditor, Quill } from "vue2-editor"

import vue2Dropzone from 'vue2-dropzone'
import 'vue2-dropzone/dist/vue2Dropzone.min.css'

import { VBScrollspyPlugin } from 'bootstrap-vue'
import InfiniteLoading from 'vue-infinite-loading'

export default {
  components: {
    Breadcrumbs,
    "font-awesome-icon": FontAwesomeIcon,
    vSelect,
    ICountUp,
    VueCircle,
    editor: VueEditor,
    vueDropzone: vue2Dropzone,
    InfiniteLoading,
    VBScrollspyPlugin,
  },
  props: ['taskId', 'taskName'],
  data: () => ({
    /*
    startVal: 0,
    endVal: 423,
    decimals: 0,
    duration: 2.5,
    options: {
      useEasing: true,
      useGrouping: true,
      separator: ",",
      decimal: ".",
      prefix: "",
      suffix: ""
    },
    fill: { color: "#d92550" },
    */
    //***********END PAGINATION PARAMS **********
    navItems: [],// ['#page-1', '#page-2', '#page-3'],
    perPage: 15,
    offset: 15,
    currentPage: null,
    currentPageNav: null,
    lastPage: null,
    //***********END PAGINATION PARAMS **********
    dropzoneOptions: {
        url: conf.urlUpload,
        //headers: { "My-Awesome-Header": "header value" },
        headers: {
            //'Authorization': authorizationHeader,
            'Cache-Control': null,
            'X-Requested-With': null
        },
        dictDefaultMessage: "<i class='fa fa-cloud-upload'></i>DROP HERE NOTE FILES",
        maxFilesize: 10, // MB
        maxFiles: 10,
        //chunking: true,
        //chunkSize: 500, // Bytes
        thumbnailWidth: 50, // px
        thumbnailHeight: 50,
        //addRemoveLinks: true
    },
    dropzoneOptionsNote: {
        url: conf.urlUpload,
        //headers: { "My-Awesome-Header": "header value" },
        headers: {
            //'Authorization': authorizationHeader,
            'Cache-Control': null,
            'X-Requested-With': null
        },
        dictDefaultMessage: "<i class='fa fa-cloud-upload'></i>DROP HERE NOTE FILES",
        maxFilesize: 10, // MB
        maxFiles: 10,
        //chunking: true,
        //chunkSize: 500, // Bytes
        thumbnailWidth: 50, // px
        thumbnailHeight: 50,
        //addRemoveLinks: true
    },
    viewMode: "page",

    noteList: [],
    
    noteFiles: [],
    noteErrors: [],
    modalTitle: null,

    nameState: null,
    membersState: null,
    descriptionState: null,
    statusState: null,
    themeState: null,

    submittedNames: [],
    noteId: null,
    noteName: "",
    noteDescription: "",
    noteMembers: "",
    noteStatus: "",
    noteTheme: "",

    noteOptionsMembers: [
      "advertiser",
      "userman",
      "websofter",
      "user1",
      "superman"
    ],
    noteOptionsStatus: [
      { value: 1, text: "Public" },
      { value: 2, text: "Private" },
      { value: 3, text: "Protected" }
    ],
    noteOptionsTheme: [
      { value: 1, text: "IT" },
      { value: 2, text: "Finance" },
      { value: 3, text: "Develop" },
      { value: 4, text: "Building" }
    ],
  }),

  computed: {
    ...mapGetters(["note", "notes", "profile"])
  },
  methods: {
    ...mapActions([
      "readNote",
      "readNotes",
      "readUpload",
      "deleteNote",
      "createNote",
      "updateNote"
    ]),
    /***********************START PAGINATION*********************** */
    changePage(navItem){
      console.log(navItem)
      const href = '#page-' + navItem //e.target.getAttribute('href')
      const el = href ? document.querySelector(href) : null
      if (el) {
        this.$refs.infinite_content.scrollTop = el.offsetTop
      }
    },
    /*
    setCurrentPageDetails (pageNum) { 
      console.log(pageNum)
      this.currentPage = parseInt(pageNum) 
    },
    */
    infiniteHandler( $state ) {
      let self = this
      setTimeout(()=>{
        if(self.currentPage == self.lastPage) {
          self.$root.$on('bv::scrollspy::activate', self.onActivate)
        }
        
        self.taskId = typeof self.$route.params.taskId === "undefined" ? self.taskId : self.$route.params.taskId
        const filter = { task : self.taskId, page: self.currentPage, limit: self.perPage}
        
        self.readNotes( filter ).then(response => {
          if (response.data.results.length > 0 && self.currentPage >= 1) {
            self.navItems.push({page: self.currentPage,  link: `#page-${self.currentPage}`, text: self.currentPage})
            //self.noteList.push(...self.notes)
            self.noteList.unshift(...self.notes)
            $state.loaded()
            //
            self.currentPage--
            self.currentPageNav = self.currentPage
          } else {
            $state.complete()
          }
        }).catch(err => {
          console.error(err)
        })
      }, 500)
    },
    scrollIntoView(e) {
      e.preventDefault()
      console.log(e)
      const href = e.target.getAttribute('href')
      const el = href ? document.querySelector(href) : null
      if (el) {
        this.$refs.infinite_content.scrollTop = el.offsetTop
      }
    },
    onActivate(target) {
      let pageNum = target.split('-')[1]
      this.currentPageNav = pageNum
    },
    /***********************END PAGINATION*********************** */
    editNote(e, taskId, note, action = null) {
      const noteId = note.id
      let self = this
      if(action == 'save'){
        //this.$refs['note_title_' + noteId][0].setAttribute("contenteditable", false)
        this.$refs['note_description_' + noteId][0].setAttribute("contenteditable", false)
        this.$refs['note_description_' + noteId][0].classList.remove("border")
        this.$refs['note_description_' + noteId][0].classList.remove("border-success")
        //
        this.$refs['dropzone_' + taskId + '_' + noteId][0].$el.classList.add("d-none")
        this.$refs['note_message_' + noteId][0].classList.remove("border-success")
        this.$refs['btn_note_save_' + noteId][0].classList.add("d-none")
        this.$refs['btn_note_edit_' + noteId][0].classList.remove("d-none")

        if(this.$refs['btn_file_delete_' + noteId] !== undefined){
          this.$refs['btn_file_delete_' + noteId][0].classList.remove("d-none")
          this.$refs['btn_file_delete_' + noteId].forEach((btnDelFile)=>{
            btnDelFile.classList.add("d-none")
          })
        }
        //const noteTitle = this.$refs['note_title_' + noteId][0].innerText
        const noteDescription = this.$refs['note_description_' + noteId][0].innerText
        //
        let files = []
        note.files.forEach((f)=>{
          if(f.status){
            files.push(f.id)
          }
        })
        //
        this.updateNote({
          id: noteId,
          //title: noteTitle,
          files: files,
          description: noteDescription,
          status: 1
        }).then(response => {
          let index = self.noteList.findIndex(x => x.id == response.data.id)
          self.$set(self.noteList, index, response.data)
        }).catch(error=>{
          console.error(error)
        })
      }else{
        //this.$refs['note_title_' + noteId][0].setAttribute("contenteditable", true)
        this.$refs['note_description_' + noteId][0].setAttribute("contenteditable", true)
        this.$refs['note_description_' + noteId][0].classList.add("border")
        this.$refs['note_description_' + noteId][0].classList.add("border-success")
        //
        this.$refs['dropzone_' + taskId + '_' + noteId][0].$el.classList.remove("d-none")
        this.$refs['note_message_' + noteId][0].classList.add("border-success")
        this.$refs['btn_note_save_' + noteId][0].classList.remove("d-none")
        this.$refs['btn_note_edit_' + noteId][0].classList.add("d-none")

        if(this.$refs['btn_file_delete_' + noteId] !== undefined){
          this.$refs['btn_file_delete_' + noteId].forEach((btnDelFile)=>{
            btnDelFile.classList.remove("d-none")
          })
        }
      }
    },
    addNote(taskId){

      let self = this
      self.noteErrors = []

      //if(this.noteTitle == undefined || this.noteTitle.length == 0) this.noteErrors.push("Empty title")
      //if(this.noteTitle == undefined || this.noteTitle.length < 9) this.noteErrors.push("Title will be have 10 or more letters")
     
      if(self.noteDescription == undefined || self.noteDescription.length == 0) self.noteErrors.push("Empty description")
      if(self.noteDescription == undefined || self.noteDescription.length < 3) self.noteErrors.push("Description will be have 3 or more letters")
      
      if(self.noteErrors.length === 0 ){
        let files = []
        self.noteFiles.forEach(function(file){
          files.push(file.id)
        })
        //
        const note = {
          //title: this.noteTitle,
          description: self.noteDescription,
          files,
          task: taskId,
          user: self.profile.id,
          status: 1,
        }
        
        self.createNote(note)
        .then(response =>{
          //this.noteTitle = ""
          self.noteDescription = ""
          self.noteFiles = []
          self.noteErrors = []
          //self.reloadNotes(taskId)
          self.countPages(taskId, (r)=>{
            self.noteList.push(response.data)
            util.scrollToEnd(self, "infinite_content", 0)
          })
        })
        .catch(error => {
          console.error(error)
        })
        
      }
    },
    fileNameLimit(fileName){
      return util.fileNameLimit(fileName)
    },
    downloadFile(file){
      console.log(file)
      util.downloadFile(file.link, file.name)
    },
    delNote(taskId, noteId){
      let self = this
      self.deleteNote(noteId)
      .then(response => {
        self.noteList = self.noteList.filter(function( note ) {
                            return note.id !== noteId
                        })
      }).catch(error => {
        console.error(error)
      })
    },
    delFile(task, note, file){
      let self = this
      note.files.forEach((f)=>{
        if(f.id ==  file.id){
          f.status = !f.status
        }
      })
    },
    onReady: function(instance) {
      const that = this;
      instance.update(that.endVal + 100);
    },
    afterCompleteUploadFile(file) {
      const response = JSON.parse(file.xhr.response)
      let f = util.getFileInfo(response.file.name)
      f.id = response.id
      f.link = response.file.url
      f.size = response.file.size
      this.noteFiles.push(f)
      //
      //this.$refs.dropzone.removeFile(file)
      let self = this
      setTimeout(()=>{
        //this.$refs.dropzone[0].removeAllFiles(true)
        //console.log(this.$refs)
        //console.log(file.previewElement.parentNode.getAttribute("id"))
        //console.log(this.$refs[file.previewElement.parentNode.getAttribute("id")])
        this.$refs[file.previewElement.parentNode.getAttribute("id")].removeAllFiles(true)
      }, 1000)
    },
    afterCompleteUploadFileNote(file, task, note) {
      const response = JSON.parse(file.xhr.response)
      let f = util.getFileInfo(response.file.name)
      f.id = response.id
      f.link = response.file.url
      f.size = response.file.size
      note.files.push({id: f.id, status: 1, file: f, new : true})

      let self = this
      setTimeout(()=>{
        //console.log(this.$refs, file.previewElement.parentNode.getAttribute("id"))
        this.$refs[file.previewElement.parentNode.getAttribute("id")][0].removeAllFiles(true)
      }, 1000)
    },
    reloadNotes(taskId = null){
      let self = this
      let filter = { task: taskId }
      //
      self.readNotes(filter).then((response) => {
        if (response.data.results.length>0) {
          self.noteList = self.notes
        }
      }).catch(error => {
        console.error(error)
      })
    },
    countPages(id, callback = null){
      let self = this
      let filter = {task : id}
      self.readNotes(filter).then(response => {
        self.lastPage = Math.ceil(response.data.count/self.offset)
        self.currentPage = self.lastPage
        if(callback) callback(response.data.results)
      }).catch(error => {
        console.error(error)
      })
    }
  },
  mounted() {
    let self = this

    if(typeof self.$route.params.taskId !== "undefined"){
      self.taskId = self.$route.params.taskId
      self.viewMode = "page"
    }else{
      //this.taskId = this.taskId
      self.viewMode = "dialog"
    }
    //
    self.countPages(self.taskId)
  },
  created() {
    /*
    let self = this

    if(typeof self.$route.params.taskId !== "undefined"){
      this.taskId = this.$route.params.taskId
      this.viewMode = "page"
    }else{
      //this.taskId = this.taskId
      this.viewMode = "dialog"
    }
    */
    /*
    if(self.taskId){
      let filter = {task : self.taskId}
      this.readNotes(filter).then(response => {
        self.noteList = response.data.results
      }).catch(error => {
        console.error(error)
      })
    }
    */
  }
}
</script>

<style lang="scss">
.dropzone{
  width: 100%;
}
.d-contents {
    display: contents;
}
tr{
  cursor: pointer;
}
.dynamic-tables {
  &__search {
  }
  &__select {
    display: flex;
    align-items: center;
    .custom-select {
      margin-left: 0.5rem;
      margin-right: 0.5rem;
      max-width: 4.25rem;
    }
    &-span {
      line-height: 2.25rem;
    }
  }
}
.space-between {
  display: flex;
  justify-content: space-between;
}
.delete {
  font-size: 18px;
  cursor: pointer;
}
.cursor-pointer {
  cursor: pointer;
}
.modal-backdrop,
#modal-prevent-closing___BV_modal_backdrop_ {
  background-color: #00000095;
}
</style>