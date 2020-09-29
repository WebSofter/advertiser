<template>
  <div>
    <div>
      <Breadcrumbs /> <!--<div>Task {{ $route.params.companyId }}</div>-->
    </div>
    <b-card title="Tasks of Company" class="main-card">
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
    
      <b-nav element="#infinite_content" slot="header" v-b-scrollspy:infinite_content_task>
        <b-nav-item v-for="(navItem, $index) in navItems" :key="$index" :href="navItem.link" @click="scrollIntoView">
          {{ navItem.page }}
        </b-nav-item>
      </b-nav>
      
<!--
      <b-row>
        <b-col class="my-3 w-100" lg="12" :ref="'infinite_content'" id="infinite_content_task" text="center"  style="position:relative;height:500px;overflow-y:scroll;">
          <v-flex v-for="(task, $index) in taskList" :key="$index" class="example-list-item" :id="task.hasOwnProperty('page') ? ('page-' + task.page) : ''">
            {{ task.name }}
          </v-flex>
          <infinite-loading @infinite="infiniteHandler"></infinite-loading>
        </b-col>
      </b-row>
-->
      <b-row>
        <b-col lg="6" class="my-1"></b-col>
        <b-col lg="4" class="my-1 dynamic-tables__search"></b-col>
        <b-col lg="2" class="my-1 dynamic-tables__search"></b-col>
      </b-row>

      <b-row>
        <b-col lg="12" md="12" class="my-1 space-between">
            <div class="main-card mb-3 card w-100 d-block ">
              <div class="card-header">ToDo List</div>
              <ul class="todo-list-wrapper list-group list-group-flush" ref="infinite_content" id="infinite_content_task" style="position:relative;max-height:800px;overflow-y:scroll;">
                <li v-for="task in taskList" :key="task.id" class="list-group-item cursor-pointer example-list-item" :id="task.hasOwnProperty('page') ? ('page-' + task.page) : ''">
                  <div class="todo-indicator" :ref="'indicator_' + task.id" :class=" task.status == 1 ? 'bg-warning' : task.status == 2 ? 'bg-dark' : 'bg-success'"></div>
                  <div class="widget-content p-0">
                    <div class="widget-content-wrapper">
                      <div class="widget-content-left mr-2" @click="openNotesInfo(task.id)">
                        <div class="custom-checkbox custom-control">
                          <font-awesome-icon icon="tasks" />
                        </div>
                      </div>
                      <div class="widget-content-left flex2">
                        <div class="widget-heading" @click="openNotesDialog(task.id, task.name)">{{ task.name }}</div>
                        <div class="widget-subheading"  @click="openNotesDialog(task.id, task.name)">{{ task.description }}</div>
                        <div class="widget-subheading">
                          <b-button v-for="link in task.links" :key="link.id" variant="link" @click="goToLink(link.link)">{{ link.title }} <font-awesome-icon icon="external-link-alt" size="xs"/></b-button>
                        </div>
                      </div>
                    </div>
                  </div>
                  <b-collapse :id="'collapse_' + task.id" :accordion="'notes_accordion_'+task.id" class="mt-2">
                    <div class="widget-content p-0">
                      <div class="widget-content-wrapper">
                        <div class="widget-content-left mr-2"></div>
                        <div class="widget-content-left flex2" >
                          <div class="widget-heading"> </div>
                          <div class="widget-subheading"> </div>
                        </div>
                        <div class="widget-content-right">
                          <div class="badge badge-warning mr-2">{{ noteList.length == 0 ? 0 : noteList[task.id]===undefined ? 0 : noteList[task.id].count }} notes</div>
                        </div>
                        <div class="widget-content-right">
                          <button @click="delTask(task.id)" class="border-0 btn-transition btn btn-outline-danger">
                            <font-awesome-icon icon="trash-alt" />
                          </button>
                          <button @click="showModal(task.id)" class="border-0 btn-transition btn btn-outline-success">
                            <i class="pe-7s-note cursor-pointer"></i>
                          </button>
                          <button @click="openNotesPage(task.id)" class="border-0 btn-transition btn btn-outline-success">
                            <i class="pe-7s-angle-right-circle cursor-pointer"></i>
                          </button>
                        </div>
                      </div>
                    </div>
                  </b-collapse>
                </li>
                <infinite-loading direction="bottom" spinner="waveDots" force-use-infinite-wrapper="#infinite_content_task" @infinite="infiniteHandler" slot="append">
                  <div slot="spinner my-2">Loading...</div>
                  <div slot="no-more my-2">No more content</div>
                  <div slot="no-results my-2">No results</div>
                </infinite-loading>
              </ul>
              <div class="d-block text-right card-footer">
                <button class="btn btn-success btn-lg" @click="showModal()">Add new task</button>
              </div>
            </div>
        </b-col>
      </b-row>

    </b-card>
    <b-modal
      id="modalTask"
      ref="modal"
      :title="modalTitle"
      @show="resetModal"
      @hidden="resetModal"
      @ok="handleOk"
    >
      <form ref="form" @submit.stop.prevent="handleSubmit">

      <div v-if="modalTitle == 'New Task'">
        <b-form-group label="Select the type of task adding">
          <b-form-radio-group
            id="btn-radios-2"
            v-model="taskType"
            :options="taskOptionsType"
            buttons
            button-variant="outline-primary"
            name="radio-btn-outline"
          ></b-form-radio-group>
        </b-form-group>
      </div>
      <div v-if="taskType=='template' || modalTitle == 'Add Task'">
        <b-card title="Task templates">
          <div class="input-group mb-3" v-for="(taskTemplate, index) in taskOptionsTemplate" :key="index">
            <div class="input-group-prepend">
              <div class="input-group-text">
                <input type="checkbox" v-model="taskTemplate.auto_join" v-tooltip.top-center="taskTemplate.description" aria-label="Checkbox for following text input">
              </div>
            </div>
            <input type="text" class="form-control" v-model="taskTemplate.name" aria-label="Text input with checkbox">
          </div>
        </b-card>
      </div>
      <div v-else>
        <b-form-group
          :state="nameState"
          label="Name"
          label-for="name-input"
          invalid-feedback="Name is required"
        >
          <b-form-input id="name-input" v-model="taskName" :state="nameState" required></b-form-input>
        </b-form-group>
        <b-form-group
          :state="descriptionState"
          label="Description"
          label-for="description-input"
          invalid-feedback="Description is required"
        >
          <b-form-textarea
            id="description-input"
            v-model="taskDescription"
            placeholder="Type description..."
            rows="3"
            max-rows="6"
          ></b-form-textarea>
        </b-form-group>
        <b-form-group
          :state="statusState"
          label="Status"
          label-for="status-input"
          invalid-feedback="Status is required"
        >
          <b-form-select id="status-input" v-model="taskStatus" :options="taskOptionsStatus"></b-form-select>
        </b-form-group>
        <!--Date start-->
        <b-form-group
          :state="dateEndState"
          label="Date"
          label-for="date-end-input"
          invalid-feedback="Date end is required"
        >
          <VueCtkDateTimePicker format='YYYY-MM-DD hh:mm' label="Дата" button-now-translation="Сегодня" v-model="taskDateEnd" />
          <!--<b-form-datepicker id="date-end-input" v-model="taskDateEnd" class="mb-2"></b-form-datepicker>-->
        </b-form-group>
        <b-form-group :state="linksState" label="Links" label-for="links-input">
          <b-input-group>
            <div class="col-12 mx-0 px-0">
              <v-select label="link" :filterable="false" v-model="taskLinks" multiple :options="taskOptionsLinks" @search="onSearchLinks" full-width="true">
                <template slot="no-options">
                  type to search links for join as link of this task...
                </template>
                <template slot="option" slot-scope="link">
                  <div class="d-center">
                    <b-button variant="link" @click="goToLink(link.link)">{{ link.title }} <font-awesome-icon icon="external-link-alt" size="xs"/></b-button>
                  </div>
                </template>
                <template slot="selected-option" slot-scope="link">
                  <div class="selected d-center">
                    <b-button variant="link" @click="goToLink(link.link)">{{ link.title }} <font-awesome-icon icon="external-link-alt" size="xs"/></b-button>
                  </div>
                </template>
              </v-select>
            </div>
            <div class="mt-1 w-100">
              <b-input-group class="mt-3">
                <b-input-group-prepend>
                  <b-button variant="primary">
                    <font-awesome-icon icon="external-link-alt"/>
                  </b-button>
                </b-input-group-prepend>
                <b-form-input v-model="taskNewLinkTitle" placeholder="Type title"></b-form-input>
                <b-form-input v-model="taskNewLinkURL" placeholder="Type URL"></b-form-input>
                <b-input-group-append>
                  <b-button variant="success">
                    <font-awesome-icon @click="addNewLink" icon="plus" size="xs"/>
                  </b-button>
                </b-input-group-append>
              </b-input-group>
            </div>
          </b-input-group>
        </b-form-group>
      </div>
      </form>
    </b-modal>

    <!-- Notes Dialog -->
      <v-dialog
        v-model="dialogNotes"
        fullscreen
        hide-overlay
        transition="dialog-bottom-transition"
        scrollable
      >
        <v-card tile>
          <v-toolbar
            color="primary"
          >
            <v-toolbar-items>
              <v-btn
                small
                color="error"
                @click="dialogNotes = false"
              >
                Close
              </v-btn>
            </v-toolbar-items>
          </v-toolbar>

          <v-card-text ref="notes_dialog">
              <Notes v-if="dialogNotes" :taskId="taskId" :taskName="taskName"/>
          </v-card-text>

          <div style="flex: 1 1 auto;"></div>
        </v-card>
      </v-dialog>
  </div>
</template>

<script>
import axios from 'axios'
import Vue from 'vue'
//import Test from 'test.vue'
import Breadcrumbs from "../components/Breadcrumbs";
import { mapGetters, mapActions } from "vuex";
import vSelect from "vue-select";
import conf from '../configuration'
import util from '../util'
import { library } from "@fortawesome/fontawesome-svg-core";
import { faStar, faPlus, faTrashAlt, faCheck, faEdit, faFileImage, faFileVideo, faFileWord, faTasks, faMinusCircle, faTrashRestore, faExternalLinkAlt } from "@fortawesome/free-solid-svg-icons";
import { FontAwesomeIcon } from "@fortawesome/vue-fontawesome";

import ICountUp from "vue-countup-v2";
import VueCircle from "vue2-circle-progress";
import { VBScrollspyPlugin } from 'bootstrap-vue'

library.add(faStar, faPlus, faTrashAlt, faCheck, faEdit, faFileImage, faFileVideo, faFileWord, faTasks, faMinusCircle, faTrashRestore, faExternalLinkAlt)

import Notes from "./Notes"

import InfiniteLoading from 'vue-infinite-loading'


//import 'codemirror/lib/codemirror.css';
//import '@toast-ui/editor/dist/toastui-editor.css';
 
//import { Editor } from '@toast-ui/vue-editor';

import VueCtkDateTimePicker from 'vue-ctk-date-time-picker';
import 'vue-ctk-date-time-picker/dist/vue-ctk-date-time-picker.css';
import VTooltip from 'v-tooltip'

Vue.use(VTooltip)
Vue.use(InfiniteLoading)
Vue.use(VBScrollspyPlugin)

export default {
  components: {
    //InfiniteLoading,
    //VBScrollspyPlugin,
    Breadcrumbs,
    ICountUp,
    VueCircle,
    "font-awesome-icon": FontAwesomeIcon,
    vSelect,
    VueCtkDateTimePicker,
    Notes
  },

  data: () => ({
    dialogNotes: false,
    //page: 1,
    taskList: [],
    noteList: [],
    //***********END PAGINATION PARAMS **********
    navItems: [],// ['#page-1', '#page-2', '#page-3'],
    perPage: 15,
    offset: 15,
    currentPage: 1,
    currentPageNav: 1,
    //***********END PAGINATION PARAMS **********
    
    isHiddenForm: true,
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

    modalTitle: null,

    nameState: null,
    descriptionState: null,
    statusState: null,
    dateStartState: null,
    timeStartState: null,
    dateEndState: null,
    timeEndState: null,
    linksState: null,
    
    taskId: null,
    taskName: "",
    taskDescription: "",
    taskStatus: "",
    taskDateStart: "",
    taskTimeStart: "",
    taskDateEnd: "",
    taskTimeEnd: "",
    taskLinks: [],
    taskType: 'template',
    taskOptionsType: [
      { text: 'Template', value: 'template' },
      { text: 'Custom', value: 'custom' },
    ],
    taskOptionsTemplate: [],
    taskOptionsLinks: [],
    taskOptionsStatus: [
      { value: 1, text: "Active" },
      { value: 2, text: "Freeze" },
      { value: 3, text: "Finish" }
    ],
    //
    taskNewLinkTitle : null,
    taskNewLinkURL : null,
  }),

  computed: {
    ...mapGetters(["task", "tasks", "notes", "profile", "links", "taskTemplates"])
  },
  watch: {
    '$route' (to, from) {
      if (to.params.pageNum) { this.setCurrentPageDetails(to.params.pageNum) } 
    }
  },
  methods: {
    ...mapActions([
      "readTaskTemplates",
      "readTask",
      "readTasks",
      "deleteTask",
      "createLink",
      "readLink",
      "createTask",
      "updateTask",
      "readUpload",
      "readNotes",
    ]),
    /***********************START PAGINATION*********************** */
    changePage(navItem){
      const href = '#page-' + navItem //e.target.getAttribute('href')
      const el = href ? document.querySelector(href) : null
      if (el) {
        this.$refs.infinite_content.scrollTop = el.offsetTop
      }
    },
    setCurrentPageDetails (pageNum) { 
      //console.log(pageNum)
      this.currentPage = parseInt(pageNum) 
    },
    infiniteHandler( $state ) {

      let self = this
      setTimeout(() => {
        if(self.currentPage == 1) {
          self.$root.$on('bv::scrollspy::activate', self.onActivate)
        }

        const filter = { company : self.$route.params.companyId, page: self.currentPage, limit: self.perPage}
        self.readTasks( filter ).then(response => {
          if (response.data.results.length > 0) {
            self.navItems.push({page: self.currentPage,  link: `#page-${self.currentPage}`, text: self.currentPage})
            self.taskList.push(...self.tasks)
            //
            self.currentPageNav = self.currentPage
            self.currentPage++
            //
            $state.loaded()
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
      console.log(target, this.currentPageNav)
      let pageNum = target.split('-')[1]
      this.currentPageNav = pageNum
    },
    /***********************END PAGINATION*********************** */
    delTask(taskId){
      let self = this
      self.deleteTask(taskId).then(response => {
        self.taskList = self.taskList.filter(function( task ) {
                            return task.id !== taskId
                        })
        /*
        self.taskList.forEach((task, index) => {
          if(task.id = response.data.id){

          }
        })
        */
      })
    },
    addNewLink(){
      let self = this
      if(this.taskNewLinkURL == null || this.taskNewLinkURL.length <= 3 || this.taskNewLinkTitle == null || this.taskNewLinkTitle <= 3) return false
      //
      this.createLink({
        link: this.taskNewLinkURL,
        title: this.taskNewLinkTitle,
      }).then(res => {
        self.taskLinks.push(res.data)
        self.taskNewLinkTitle = null
        self.taskNewLinkURL = null
      })
    },
    onSearchLinks(search, loading) {
      loading(true);
      this.searchLinks(loading, search, this)
    },
    searchLinks(loading, search, vm){
      //try{
        axios.get(`${conf.urlApi}/link/?title=` + search).then(response=>{
          vm.taskOptionsLinks = response.data.results
          loading(false)
        }).catch(error =>{
          console.error(error)
        })
      //}catch(e){}
    },
    goToLink(link, target){
      return util.goToLink(link, target)
    },
    handleClick(newTab) {
      this.currentTab = newTab;
    },
    onReady: function(instance) {
      const that = this;
      instance.update(that.endVal + 100);
    },
    openNotesInfo(taskId){
      let self = this
      self.$root.$emit('bv::toggle::collapse', 'collapse_' + taskId)
      self.readNotes({ task : taskId }).then(response => {
        self.$set(self.noteList, taskId, response.data)
      })
    },
    openNotesDialog(taskId, taskName = null){
      let self = this
      self.dialogNotes = !self.dialogNotes
      self.taskId = taskId
      self.taskName = taskName
      //this.$root.$emit('bv::toggle::collapse', 'collapse_' + taskId)
      //this.reloadNotes(taskId)

      util.scrollToEnd(self, 'notes_dialog')
    },
    openNotesPage(taskId) {
      this.$router.push({ path: `tasks/${taskId}/notes` })
    },
    onFiltered(filteredItems) {
      // Trigger pagination to update the number of buttons/pages due to filtering
      this.totalRows = filteredItems.length;
      this.currentPage = 1;
    },

    showModal(id = null) {
      if(id === null){
        this.modalTitle = "New Task";
        this.taskName = "";
        this.taskDescription = "";
        this.taskStatus = "";
        this.taskDateStart = "";
        this.taskTimeStart = "";
        this.taskDateEnd = "";
        this.taskTimeEnd = "";
        this.taskLinks = []
        this.initTaskTemplates()
      }else{
        this.readTask(id).then(response=>{
          this.modalTitle = "Edit Task"
          this.taskType = "custom"
          this.taskId = id
          this.taskName = this.task.name
          this.taskDescription = this.task.description
          this.taskStatus = this.task.status
          this.taskDateStart = "" //this.task.date
          this.taskTimeStart = "" //this.task.date
          this.taskDateEnd = this.task.date_end
          this.taskTimeEnd = "" //this.task.date
          this.taskLinks = this.task.links
        });
      }
      this.$root.$emit("bv::show::modal", "modalTask", "#btnShow");
    },
    hideModal() {
      this.$root.$emit("bv::hide::modal", "modalTask", "#btnShow");
    },
    toggleModal() {
      this.$root.$emit("bv::toggle::modal", "modalTask", "#btnToggle");
    },
    checkFormValidity() {
      const valid = this.$refs.form.checkValidity();
      this.nameState = valid;
      return valid;
    },
    resetModal() {
      this.name = "";
      this.nameState = null;
    },
    handleOk(bvModalEvt) {
      // Prevent modal from closing
      bvModalEvt.preventDefault();
      // Trigger submit handler
      this.handleSubmit();
    },
    createTaskFromTemplates(taskTemplates, companyId){
      let self = this
      taskTemplates.forEach((task)=>{
        if(task.auto_join){
          task.company = companyId //company.id
          task.status = 1
          //
          let links = []
          task.links.forEach((link) => {
            links.push(link.id)
          })
          task.links = links
          //
          self.createTask(task).then(response => {
            response.data.links = self.getLinksByIds(response.data.links)
            self.taskList.unshift(response.data)
          })
        }
      })
    },
    handleSubmit() {
      // Exit when the form isn't valid
      if (!this.checkFormValidity()) {
        return;
      }

      let self = this
      
      let links = []

      self.taskLinks.forEach((link)=>{
        links.push(link.id)
      })

      if (this.modalTitle == "New Task"){
        if(this.taskType == "custom"){
          const task = {
            name: this.taskName,
            company: this.$route.params.companyId,
            description: this.taskDescription,
            links: links,
            status: this.taskStatus,
            date_end: this.taskDateEnd
          }
          self.createTask(task).then(response => {
            response.data.links = self.getLinksByIds(response.data.links)
            self.taskList.unshift(response.data)
          })
        }else{
          self.createTaskFromTemplates(this.taskOptionsTemplate, this.$route.params.companyId)
        }        
      }
      if (self.modalTitle == "Edit Task") {

        const task = {
          id: this.taskId,
          name: this.taskName,
          company: this.$route.params.companyId,
          description: this.taskDescription,
          links: links,
          status: this.taskStatus,
          date_end: this.taskDateEnd
        }
        self.updateTask(task).then(response => {
          //
          response.data.links = self.getLinksByIds(response.data.links)
          /*
          if(response.data.links.length > 0){
            let links = []
            response.data.links.forEach((id, i) => {
              self.readLink(id).then(r => {
                links.push(r.data)
              })
            })
            response.data.links = links
          }
          */
          //
          let index = self.taskList.findIndex(x => x.id == response.data.id)
          self.$set(self.taskList, index, response.data)
        }).catch(error =>{
          console.error(error)
        })
      }
      
      // Hide the modal manually
      this.$nextTick(() => {
        this.$bvModal.hide("modalTask");
      });
    },
    getLinksByIds(linkIds){
      let self = this
      if(linkIds.length > 0){
        let links = []
        linkIds.forEach((id, i) => {
          self.readLink(id).then(r => {
            links.push(r.data)
          })
        })
        return links
      }else{
        return []
      }
    },
    initTaskTemplates(){
      this.readTaskTemplates().then(response => {
        this.taskOptionsTemplate = this.taskTemplates
        this.taskOptionsTemplate.forEach((task)=>{
          task.auto_join = false
        })
      }).catch(error => {
        console.error(error)
      })
    },
  },
  mounted() {
    this.initTaskTemplates()
  },
  created() {

  },
}
</script>

<style lang="scss">
.example-list-item {
  margin: 0;
  padding: 0 10px;
  font-size: 14px;
  line-height: 40px;
  color: #666;
  background-color: #fafafa;
  border-top: 1px solid #fff;
  border-bottom: 1px solid #e3e3e3;
}

.text-removed{
  text-decoration: line-through;
}
#dropzone{
  width: 100%;
}
.dropzone .dz-message{

}
.d-contents {
    display: contents;
}
.ql-toolbar.ql-snow, .ql-container.ql-snow{
  border: none!important;
}
.ql-editor {
    min-height: 100px!important;
    font-size: 12px!important;
    font-style: normal!important;
}
.editor{
  min-height: 100px;
}
.b-calendar-inner{
  width:300px!important;
}
.dropdown-menu.show{
  text-align: center;
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