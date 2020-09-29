<template>
  <div>
    <div>
      <Breadcrumbs />
    </div>
    <b-card title="Task Templates" class="main-card mb-4">
      <b-row>
        <b-col lg="6" class="my-1">
          <b-form-group horizontal label class="mb-0">
            <b-input-group class="dynamic-tables__select">
              <span class="dynamic-tables__select-span">Show</span>
              <b-form-select :options="pageOptions" v-model="perPage" />
              <span class="dynamic-tables__select-span">entries</span>
            </b-input-group>
          </b-form-group>
        </b-col>
        <b-col lg="4" class="my-1 dynamic-tables__search">
          <b-form-group horizontal class="mb-0">
            <b-input-group>
              <b-form-input v-model="filter" placeholder="Search" />
              <b-input-group-append>
                <b-btn :disabled="!filter" @click="filter = ''">Clear</b-btn>
              </b-input-group-append>
            </b-input-group>
          </b-form-group>
        </b-col>
        <b-col lg="2" class="my-1 dynamic-tables__search">
          <b-form-group horizontal class="mb-0 text-right">
            <b-button
              @click="showModal()"
              class="btn-shadow d-inline-flex align-items-center btn btn-success"
            >
              <font-awesome-icon class="mr-2" icon="plus" />Create Task
            </b-button>
          </b-form-group>
        </b-col>
      </b-row>
      <!-- Main table element -->
      <b-table
        show-empty
        stacked="md"
        :items="taskList"
        :fields="fields"
        :current-page="currentPage"
        :per-page="perPage"
        :filter="filter"
        :sort-by.sync="sortBy"
        :sort-desc.sync="sortDesc"
        :sort-direction="sortDirection"
        @filtered="onFiltered"
        @row-clicked="()=>{}"
      >
        <template #cell(date_start)="row">
          {{ row.item.date_start.split('T')[0] }}
        </template>
        <template #cell(date_end)="row">
          {{ row.item.date_end.split('T')[0] }}
        </template>
        <template #cell(auto_join)="row">
          {{ preset.getName(preset.task.autoJoin, row.item.auto_join) }}
        </template>
        <template #cell(status)="row">
          {{ preset.getName(preset.task.status, row.item.status) }}
        </template>
        <template #cell(links)="row">
          <b-button v-for="link in row.item.links" :key="link.id" variant="link" @click="goToLink(link.link)">
            {{ link.title }} <font-awesome-icon icon="external-link-alt" size="xs"/>
          </b-button>
        </template>
        <template #cell(showDetails)="row">
          <b-button
            size="sm"
            @click.stop="row.toggleDetails"
          >{{ row.detailsShowing ? 'Hide' : 'Show' }}</b-button>
        </template>
        <template slot="row-details" slot-scope="row">
          <b-card class="no-shadow" >
            <ul class="list-group">
              <li
                class="list-group-item"
                v-for="(value, key) in row.item"
                :key="key"
              >
                <div v-if="key === 'role'">
                  {{key}} : {{ value === '' ? 'task' : value }}
                </div>
                <div v-else-if="key === 'description'">
                  Description : {{ value }}
                </div>
                <div v-else-if="key === 'name'">
                  Name : {{ value }}
                </div>
                <div v-else-if="key === 'auto_join'">
                  Auto Join : {{ value ? 'Yes' : 'No' }}
                </div>
                <div v-else-if="key === 'date_start'">
                  Date Start : {{ value.split('T')[0] }}
                </div>
                <div v-else-if="key === 'date_end'">
                  Date End : {{ value.split('T')[0] }}
                </div>
                <div v-else-if="key === 'status'">
                  Status : {{ preset.getName(preset.task.status, row.item.status) }}
                </div>
                <div v-else-if="key === 'company'">
                  Type : Task template
                </div>
                <div v-else-if="key === 'links'">
                  Links : {{value.length == 0 ? 'No have' : '' }}
                  <b-button v-for="link in  value" :key="link.id" variant="link" @click="goToLink(link.link)">
                    {{ link.title }} <font-awesome-icon icon="external-link-alt" size="xs"/>
                  </b-button>
                </div>
                <div v-else-if = "key !== '_showDetails'">
                  {{key}} : {{ value }}
                </div>
              </li>
            </ul>
            <template v-slot:footer class="text-right d-block">
              <template >
                <b-button v-on:click="showModal(row.item.id)" size="sm" class="btn-success mx-1">Edit</b-button>
              </template>
              <template>
                <b-button size="sm" v-on:click="delTask(row.item.id)" class="btn-danger mx-1" >Delete</b-button>
              </template>
            </template>
          </b-card>
        </template>
      </b-table>
      <b-row>
        <b-col lg="12" md="6" class="my-1 space-between">
          <p>Showing 1 to {{perPage}} of {{totalRows}} entries</p>
          <b-pagination
            :total-rows="totalRows"
            :per-page="perPage"
            v-model="currentPage"
            class="my-0"
          />
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
        <!--
        <b-form-group
          :state="statusState"
          label="Status"
          label-for="status-input"
          invalid-feedback="Status is required"
        >
          <b-form-select id="status-input" v-model="taskStatus" :options="taskOptionsStatus"></b-form-select>
        </b-form-group>
        -->
        <b-form-group
          label="Auto join"
          label-for="auto-join-input"
        >
          <!-- <b-form-select id="status-input" v-model="taskAutoJoin" :options="taskOptionsStatus"></b-form-select>-->
          <b-form-checkbox
            id="auto-join-checkbox"
            v-model="taskAutoJoin"
            :value="true"
            :unchecked-value="false"
          >
            Add this task to the default company
          </b-form-checkbox>
        </b-form-group>
        <!--Date start-->
        <!--
        <b-form-group
          :state="dateEndState"
          label="Date"
          label-for="date-end-input"
          invalid-feedback="Date end is required"
        >
          <VueCtkDateTimePicker format='YYYY-MM-DD hh:mm' label="Дата" button-now-translation="Сегодня" v-model="taskDateEnd" />
        </b-form-group>
        -->
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
      </form>
    </b-modal>
  </div>
</template>

<script>
import axios from 'axios'
import Vue from 'vue'
import Breadcrumbs from "../components/Breadcrumbs";
import { mapGetters, mapActions } from "vuex";
import vSelect from "vue-select";
import conf from '../configuration'
import util from '../util'
import preset from '../preset'
import { library } from "@fortawesome/fontawesome-svg-core";
import { faStar, faPlus, faTrashAlt, faCheck, faEdit, faFileImage, faFileVideo, faFileWord, faTasks, faMinusCircle, faTrashRestore, faExternalLinkAlt } from "@fortawesome/free-solid-svg-icons";
import { FontAwesomeIcon } from "@fortawesome/vue-fontawesome";

import ICountUp from "vue-countup-v2";
import VueCircle from "vue2-circle-progress";


library.add(faStar, faPlus, faTrashAlt, faCheck, faEdit, faFileImage, faFileVideo, faFileWord, faTasks, faMinusCircle, faTrashRestore, faExternalLinkAlt)

//import 'codemirror/lib/codemirror.css';
//import '@toast-ui/editor/dist/toastui-editor.css';
 
//import { Editor } from '@toast-ui/vue-editor';
import { VueEditor, Quill } from "vue2-editor";

import vue2Dropzone from 'vue2-dropzone'
import 'vue2-dropzone/dist/vue2Dropzone.min.css'

import VueCtkDateTimePicker from 'vue-ctk-date-time-picker';
import 'vue-ctk-date-time-picker/dist/vue-ctk-date-time-picker.css';

import VTooltip from 'v-tooltip'
Vue.use(VTooltip)

const fields = [
  {
    key: "id",
    label: "ID",
    sortable: true,
    sortDirection: "desc"
  },
  {
    key: "name",
    label: "Name",
    sortable: true,
    sortDirection: "desc"
  },
  {
    key: "description",
    label: "Description",
    sortable: true,
    sortDirection: "desc"
  },
  {
    key: "auto_join",
    label: "Auto Join",
    sortable: true,
    sortDirection: "desc"
  },
  {
    key: "status",
    label: "Status",
    sortable: true,
    sortDirection: "desc"
  },
  {
    key: "date_start",
    label: "Date Start",
    sortable: true,
    sortDirection: "desc"
  },
  {
    key: "date_end",
    label: "Date End",
    sortable: true,
    sortDirection: "desc"
  },
  { key: "showDetails", label: "Details" },
];
export default {
  components: {
    Breadcrumbs,
    ICountUp,
    VueCircle,
    "font-awesome-icon": FontAwesomeIcon,
    vSelect,
    editor: VueEditor,
    vueDropzone: vue2Dropzone,
    VueCtkDateTimePicker
  },
  data: () => ({
    modalTitle: null,
    taskList: [],
    preset: {},

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
    taskAutoJoin: false,
    taskStatus: "",
    taskDateStart: "",
    taskTimeStart: "",
    taskDateEnd: "",
    taskTimeEnd: "",
    taskLinks: [],
    taskOptionsLinks: [],
    taskOptionsStatus: [
      { value: 1, text: "Active" },
      { value: 2, text: "Freeze" },
      { value: 3, text: "Finish" }
    ],
    taskNotes: [],
    //
    taskNewLinkTitle : null,
    taskNewLinkURL : null,

    taskOptionsStatus: preset.task.status,

    fields,
    currentPage: 1,
    perPage: 10,
    totalRows: 0,
    pageOptions: [5, 10, 15],
    sortBy: null,
    sortDesc: false,
    sortDirection: "asc",
    filter: null,
    modalInfo: { title: "", content: "" }, 
  }),
  computed: {
    ...mapGetters(["task", "tasks", "taskTemplates", "profile", "links"])
  },
  methods: {
    ...mapActions([
      "readTask",
      "readLinks",
      "readTaskTemplates",
      "deleteTask",
      "createLink",
      "createTask",
      "updateTask",
    ]),
    delTask(taskId){
      let self = this
      self.deleteTask(taskId).then((res)=>{
        self.initTasks()
      })
    },
    addNewLink(){
      let self = this
      if(this.taskNewLinkURL == null || this.taskNewLinkURL.length <= 3 || this.taskNewLinkTitle == null || this.taskNewLinkTitle <= 3) return false
      //
      this.createLink({
        link: self.taskNewLinkURL,
        title: self.taskNewLinkTitle,
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
        /*
        axios.get(`${conf.urlApi}/link/?title=` + search).then(response=>{
          console.log("response.datas", response.data)
          vm.taskOptionsLinks = response.data
          loading(false)
        }).catch(error =>{
          console.error(error)
        })
        */
      let filter = { title : search }
      this.readLinks(filter).then(response => {
        vm.taskOptionsLinks = response.data.results
        loading(false)
      }).catch(error => {
        console.error(error)
      })
      //}catch(e){}
    },
    fileNameLimit(fileName){
      return util.fileNameLimit(fileName)
    },
    goToLink(link, target){
      return util.goToLink(link, target)
    },
    onFiltered(filteredItems) {
      // Trigger pagination to update the number of buttons/pages due to filtering
      this.totalRows = filteredItems.length;
      this.currentPage = 1;
    },
    showModal(id = null) {

      if(id === null){
        this.modalTitle = "New Task Template";
        this.taskName = "";
        this.taskDescription = "";
        this.taskAutoJoin = false,
        this.taskStatus = "";
        this.taskDateStart = "";
        this.taskTimeStart = "";
        this.taskDateEnd = "";
        this.taskTimeEnd = "";
        this.taskLinks = []
      }else{
        this.readTask(id).then(response=>{
          this.modalTitle = "Edit Task Template"
          this.taskId = id
          this.taskName = this.task.name
          this.taskDescription = this.task.description
          this.taskAutoJoin = this.task.auto_join
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
      
      if (self.modalTitle == "New Task Template"){
        let task = {
          name: this.taskName,
          company: null, //this.$route.params.companyId,
          description: this.taskDescription,
          auto_join: this.taskAutoJoin,
          links: links,
          status: 1, //this.taskStatus,
          //date_end: this.taskDateEnd
        }
        console.log(task)
        self.createTask(task).then(res => {
          self.initTasks()
        }).catch(error => {
          console.error(error)
        })
      } else if (self.modalTitle == "Edit Task Template") {
        let task = {
          id: this.taskId,
          name: this.taskName,
          company: null, //this.$route.params.companyId,
          description: this.taskDescription,
          auto_join: this.taskAutoJoin,
          links: links,
          //status: this.taskStatus,
          //date_end: this.taskDateEnd
        }

        this.updateTask(task).then(response => {
          self.initTasks()
        }).catch(error => {
          console.error(error)
        })
      }

      // Hide the modal manually
      this.$nextTick(() => {
        this.$bvModal.hide("modalTask");
      })
    },
    initTasks(){
      let self = this
      self.readTaskTemplates().then(response => {
        self.totalRows = response.data.results.length
        self.taskList = response.data.results
      }).catch(error => {
        console.error(error)
      })
    }
  },
  mounted() {
    this.initTasks()
  },
  created(){
    this.preset = preset
  }
}
</script>



<style lang="scss">

/** USERPIC */
.vue-avatar-cropper-demo {
  max-width: 18em;
  margin: 0 auto;
}
.avatar {
  width: 160px;
  border-radius: 6px;
  display: block;
  margin: 20px auto;
}
.card-img-overlay {
  display: none;
  transition: all 0.5s;
}
.card-img-overlay button {
  margin-top: 20vh;
}
.card:hover .card-img-overlay {
  display: block;
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

/*********Tooltip***********/
.tooltip {
  display: block !important;
  z-index: 10000;

  .tooltip-inner {
    background: black;
    color: white;
    border-radius: 16px;
    padding: 5px 10px 4px;
  }

  .tooltip-arrow {
    width: 0;
    height: 0;
    border-style: solid;
    position: absolute;
    margin: 5px;
    border-color: black;
    z-index: 1;
  }

  &[x-placement^="top"] {
    margin-bottom: 5px;

    .tooltip-arrow {
      border-width: 5px 5px 0 5px;
      border-left-color: transparent !important;
      border-right-color: transparent !important;
      border-bottom-color: transparent !important;
      bottom: -5px;
      left: calc(50% - 5px);
      margin-top: 0;
      margin-bottom: 0;
    }
  }

  &[x-placement^="bottom"] {
    margin-top: 5px;

    .tooltip-arrow {
      border-width: 0 5px 5px 5px;
      border-left-color: transparent !important;
      border-right-color: transparent !important;
      border-top-color: transparent !important;
      top: -5px;
      left: calc(50% - 5px);
      margin-top: 0;
      margin-bottom: 0;
    }
  }

  &[x-placement^="right"] {
    margin-left: 5px;

    .tooltip-arrow {
      border-width: 5px 5px 5px 0;
      border-left-color: transparent !important;
      border-top-color: transparent !important;
      border-bottom-color: transparent !important;
      left: -5px;
      top: calc(50% - 5px);
      margin-left: 0;
      margin-right: 0;
    }
  }

  &[x-placement^="left"] {
    margin-right: 5px;

    .tooltip-arrow {
      border-width: 5px 0 5px 5px;
      border-top-color: transparent !important;
      border-right-color: transparent !important;
      border-bottom-color: transparent !important;
      right: -5px;
      top: calc(50% - 5px);
      margin-left: 0;
      margin-right: 0;
    }
  }

  &[aria-hidden='true'] {
    visibility: hidden;
    opacity: 0;
    transition: opacity .15s, visibility .15s;
  }

  &[aria-hidden='false'] {
    visibility: visible;
    opacity: 1;
    transition: opacity .15s;
  }
}


/******************** v-select**************** */
.v-select img {
  height: auto;
  max-width: 2.5rem;
  margin-right: 1rem;
  border-radius:50%;
}

.d-center {
  display: flex;
  align-items: center;
}

.selected img {
  width: auto;
  max-height: 23px;
  margin-right: 0.5rem;
}

.v-select .dropdown li {
  border-bottom: 1px solid rgba(112, 128, 144, 0.1);
}

.v-select .dropdown li:last-child {
  border-bottom: none;
}

.v-select .dropdown li a {
  padding: 10px 20px;
  width: 100%;
  font-size: 1.25em;
  color: #3c3c3c;
}

.v-select .dropdown-menu .active > a {
  color: #fff;
}


</style>