<template>
  <div>
    <div>
      <Breadcrumbs />
    </div>
    <b-card title="Companies" class="main-card mb-4">
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
            <!--
                <b-btn :disabled="!filter" @click="filter = ''" class="btn-success cursor-pointer">
                  <i class="pe-7s-plus cursor-pointer"></i>
                </b-btn>
            -->
            <!--v-b-modal.modalCompany-->
            <b-button
              @click="showModal()"
              class="btn-shadow d-inline-flex align-items-center btn btn-success"
            >
              <font-awesome-icon class="mr-2" icon="plus" />Create New
            </b-button>
          </b-form-group>
        </b-col>
      </b-row>
      <!-- Main table element -->
      <b-table
        show-empty
        ref="table_company"
        stacked="md"
        :items="companyList"
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
        <template v-slot:cell(user)="data" style="min-width:100px">
          <div class="avatar-wrapper avatar-wrapper-overlap d-flex">
            <div class="avatar-icon-wrapper avatar-icon-sm">
              <div class="avatar-icon" v-tooltip.top-center="data.item.user.username">
                <img src="@/assets/images/avatars/user_pic_male.png" alt />
                <!--
<img :src="util.getImageUrl(user.user_pic)" alt />
                -->
              </div>
            </div>
          </div>
        </template>
        <template #cell(name)="row">
          <b-button
            size="sm"
            variant="link"
            v-on:click="openCompany(row.item)"
          >{{ row.item.name }}</b-button>
        </template>
        <template #cell(date_created)="row">
          {{ row.item.date_created.split('.')[0] }}
        </template>
        <template v-slot:cell(members)="data" style="min-width:100px">
          <div class="avatar-wrapper avatar-wrapper-overlap d-inline-flex">
            <div v-for="(member, index) in data.item.members" :key="member.id" v-if="index !== undefined && index < 4" class="avatar-icon-wrapper avatar-icon-sm">
              <div class="avatar-icon">
                <img v-tooltip.top-center="member.first_name + ' ' + member.last_name" :src="util.getImageUrl(member.user_pic)" alt />
              </div>
            </div>
            <div v-on:click="editCompany(data.item.id)" class="avatar-icon-wrapper avatar-icon-sm avatar-icon-add" v-if="data.item.members.length>4" v-tooltip.top-center="'There are ' + (data.item.members.length - 4) + ' more members'">
              <div class="avatar-icon">
                <i>+</i>
              </div>
            </div>
          </div>
        </template>
        <template #cell(date_created)="row">
          <div style="width: max-content;">
            {{ row.item.date_created.split('T')[0] }}
          </div>
        </template>
        <template #cell(status)="row">
          {{preset.getName(preset.company.status, row.item.status)}}
        </template>
        <template #cell(theme)="row">
          {{preset.getName(preset.company.theme, row.item.theme)}}
        </template>
        <template #cell(icon)="row">
          <div class="avatar-icon">
            <img src="@/assets/images/avatars/company-icon.png" alt />
          </div>
        </template>
        <template #cell(process)="row">
          <div class="progress-circle-wrapper">
            <div class="circle-progress">
              <vue-circle :progress="row.item.process.percent" :size="54" :reverse="false" line-cap="round" :fill="setProcessFill(row.item.process.percent)" v-tooltip.top-center="'Task completed at ' + row.item.process.percent + '%'"
                empty-fill="rgba(0, 0, 0, .1)" :animation-start-value="0.0" :start-angle="0"
                insert-mode="append" :thickness="4" :show-percent="true">
              </vue-circle>
            </div>
          </div>
        </template>
        <template #cell(showDetails)="row">
          <b-button
            size="sm"
            class="link-dashed"
            @click.stop="row.toggleDetails"
            style="width: max-content;"
          >{{ row.detailsShowing ? 'Hide details ↑' : 'See more ↓' }}</b-button>
        </template>
        <template slot="row-details" slot-scope="row">
          <b-card class="no-shadow" >
            <ul class="list-group">
              <li
                class="list-group-item"
                v-for="(value, key) in row.item"
                :key="key"
              >
                <div v-if="key === 'members'" class="avatar-wrapper avatar-wrapper-overlap">
                  <div v-for="(member, index) in value" :key="index + '_' + member.id" v-tooltip.top-center="member.first_name + ' ' + member.last_name" class="avatar-icon-wrapper avatar-icon-sm">
                    <div class="avatar-icon">
                      <img v-tooltip.top-center="member.first_name + ' ' + member.last_name" :src="util.getImageUrl(member.user_pic)" alt />
                    </div>
                  </div>
                </div>
                <div v-else-if="key === 'user'" class="avatar-wrapper avatar-wrapper-overlap">
                  <div :key="'_' + value.id" class="avatar-icon-wrapper avatar-icon-sm">
                    <div class="avatar-icon">
                      <img src="@/assets/images/avatars/user_pic_male.png" v-tooltip.top-center="value.first_name + ' ' + value.last_name" alt />
                    </div>
                  </div>
                </div>
                <div v-else-if="key === 'date_created'">
                  created : {{ value }}
                </div>
                <div v-else-if="key === 'status'">
                  {{key}} : {{ preset.getName(preset.company.status, value)}}
                </div>
                <div v-else-if="key === 'theme'">
                  {{key}} : {{ preset.getName(preset.company.theme, value)}}
                </div>
                <div v-else-if="key === 'process'">
                  {{key}} : 
                  <b-badge v-tooltip.top-center="'All tasks'" variant="primary" class="mr-1">{{ value.all}} </b-badge>  
                  <b-badge v-tooltip.top-center="'Active tasks'" variant="danger" class="mr-1">{{ value.active}} </b-badge> 
                  <b-badge v-tooltip.top-center="'Freez tasks'" variant="dark" class="mr-1">{{ value.freez}} </b-badge> 
                  <b-badge v-tooltip.top-center="'Finished tasks'" variant="success" class="mr-1">{{ value.finish}} </b-badge> 
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
                <b-button size="sm" v-on:click="delCompany(row.item.id, row)" class="btn-danger mx-1" >Delete</b-button>
              </template>
            </template>
          </b-card>
        </template>
      </b-table>
      <b-row>
        <b-col lg="12" md="6" class="my-1 space-between">
          <p>{{ util.getPageCursor(currentPage, perPage, totalRows) }}</p>
          <b-pagination
            :total-rows="totalRows"
            :per-page="perPage"
            v-model="currentPage"
            @input="changePage"
            class="my-0"
          />
        </b-col>
      </b-row>
    </b-card>
    <b-modal
      id="modalCompany"
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
          <b-form-input id="name-input" v-model="companyName" :state="nameState" required></b-form-input>
        </b-form-group>
        <b-form-group :state="membersState" label="Members" label-for="members-input">
          <!--
          <v-select id="members-input" v-model="companyMember" :options="companyOptionsMembers"></v-select>
          -->
          <b-input-group>
            <div class="col-12 mx-0 px-0">
              <v-select label="user" :filterable="false" v-model="companyMembers" multiple :options="companyOptionsMembers" @search="onSearch" full-width="true">
                <template slot="no-options">
                  type to search users for join as member of this company...
                </template>
                <template slot="option" slot-scope="member">
                  <div class="d-center">
                    <img :src="member.user_pic.includes('http') ? member.user_pic : 'https://crm.wsofter.ru:8000' + member.user_pic"/> 
                    {{ member.first_name + ' ' + member.last_name }}
                  </div>
                </template>
                <template slot="selected-option" slot-scope="member">
                  <div class="selected d-center">
                    <img :src="member.user_pic.includes('http') ? member.user_pic : 'https://crm.wsofter.ru:8000' + member.user_pic"/> 
                    {{ member.first_name + ' ' + member.last_name }}
                  </div>
                </template>
              </v-select>
            </div><!--
            <div  class="col-1 mx-0 px-0 text-right">
              
              <b-button
                @click="addMembers()"
                class="btn-shadow text-center align-items-center btn btn-sm btn-success"
              >
                <font-awesome-icon class="mr-2" icon="plus" />
              </b-button>
              
            </div>-->
          </b-input-group>
        </b-form-group>
        <template style="min-width:100px">
          <div class="avatar-wrapper avatar-wrapper-overlap">
            <div v-for="(member, index) in companyMembers" :key="index" v-tooltip.top-center="member.first_name + ' ' + member.last_name" class="avatar-icon-wrapper avatar-icon-sm">
              <div class="avatar-icon">
                <img src="@/assets/images/avatars/user_pic_male.png" alt />
              </div>
            </div>
          </div>
        </template>

        <div class="card" v-if="modalTitle == 'New Company'">
          <div class="mb-3">
            <b-button v-b-toggle.my-collapse class="btn btn-success btn-sm">Default tasks</b-button>
            <!--<b-button v-b-toggle.my-sidebar>Toggle Sidebar</b-button>-->
          </div>

          <b-collapse id="my-collapse">
            <b-card title="Task templates">
              <div class="input-group mb-3" v-for="(taskTemplate, index) in companyOptionsTaskTemplates" :key="index">
                <div class="input-group-prepend">
                  <div class="input-group-text">
                    <input type="checkbox" v-model="taskTemplate.auto_join" v-tooltip.top-center="taskTemplate.description" aria-label="Checkbox for following text input">
                  </div>
                </div>
                <input type="text" class="form-control" v-model="taskTemplate.name" aria-label="Text input with checkbox">
              </div>
            </b-card>
          </b-collapse>
          <!--
          <b-sidebar id="my-sidebar" title="Sidebar" shadow>
            <div class="px-3 py-2">
              Cras mattis consectetur purus sit amet fermentum. Cras justo odio, dapibus ac facilisis
              in, egestas eget quam. Morbi leo risus, porta ac consectetur ac, vestibulum at eros.
            </div>
          </b-sidebar>
          -->
        </div>

        <b-form-group
          :state="descriptionState"
          label="Description"
          label-for="description-input"
          invalid-feedback="Description is required"
        >
          <b-form-textarea
            id="description-input"
            v-model="companyDescription"
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
          <b-form-select id="status-input" v-model="companyStatus" :options="companyOptionsStatus"></b-form-select>
        </b-form-group>
        <b-form-group
          :state="themeState"
          label="Theme"
          label-for="theme-input"
          invalid-feedback="Theme is required"
        >
          <b-form-select id="theme-input" v-model="companyTheme" :options="companyOptionsTheme"></b-form-select>
        </b-form-group>
      </form>
    </b-modal>
  </div>
</template>

<script>
import Vue from 'vue'
import Breadcrumbs from "../components/Breadcrumbs"
import { mapGetters, mapActions } from "vuex"
import vSelect from "vue-select"
import conf from '../configuration'
import preset from '../preset'
import util from '../util'
import axios from 'axios'
import VueCircle from "vue2-circle-progress";
import { library } from "@fortawesome/fontawesome-svg-core"
import { faStar, faPlus } from "@fortawesome/free-solid-svg-icons"
import { FontAwesomeIcon } from "@fortawesome/vue-fontawesome"
library.add(faStar, faPlus)

import VTooltip from 'v-tooltip'
Vue.use(VTooltip)

const fields = [
  /*
  {
    key: "id",
    label: "ID",
    sortable: true,
    sortDirection: "desc"
  },
  */
  {
    key: "name",
    label: "Name",
    sortable: true,
    sortDirection: "desc"
  },
  {
    key: "icon",
    label: "Icon",
    sortable: true,
    sortDirection: "desc"
  },
  {
    key: "user",
    label: "Owner",
    sortable: true,
    sortDirection: "desc"
  },
  {
    key: "members",
    label: "Members",
    sortable: true,
    sortDirection: "desc"
  },
  {
    key: "date_created",
    label: "Date",
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
    key: "status",
    label: "Status",
    sortable: true,
    sortDirection: "desc"
  },
  {
    key: "theme",
    label: "Theme",
    sortable: true,
    sortDirection: "desc"
  },
  {
    key: "process",
    label: "Process",
    sortable: true,
    sortDirection: "desc"
  },
  { key: "showDetails", label: "Details" },
  /*
  { key: "edit", label: "Edit" },
  { key: "delete", label: "Delete" }
  */
];
export default {
  components: {
    Breadcrumbs,
    "font-awesome-icon": FontAwesomeIcon,
    vSelect,
    VueCircle,
  },
  data: () => ({
    fill: { color: "#d92550" },
    modalTitle: null,
    lastPage: null,
    preset: {},
    util: {},
    companyList: [],

    nameState: null,
    membersState: null,
    descriptionState: null,
    statusState: null,
    themeState: null,

    submittedNames: [],
    companyId: null,
    companyName: null,
    companyDescription: null,
    companyMember: null,
    companyMembers: null,
    companyStatus: null,
    companyTheme: null,

    companyOptionsTaskTemplates: [],
    companyOptionsMembers: [],
    companyOptionsStatus: preset.company.status,
    companyOptionsTheme: preset.company.theme,

    fields,
    currentPage: 1,
    p: 1,
    perPage: 15,
    totalRows: 0,
    pageOptions: [5, 10, 15],
    sortBy: null,
    sortDesc: false,
    sortDirection: "asc",
    filter: null,
    modalInfo: { title: "", content: "" },
  }),
  computed: {
    ...mapGetters(["company", "companies", "profile", "users", "taskTemplates"]),
  },
  watch: {},
  methods: {
    ...mapActions([
      "readTaskTemplates",
      "readUsers",
      "readCompany",
      "readCompanies",
      "deleteCompany",
      "createCompany",
      "updateCompany",
      "refreshToken",
      "createTask",
    ]),
    changePage: function(page){
      let self = this
      let filter = self.profile.role === "admin" ? {page, limit: self.perPage} : { user : self.profile.id, page, limit: self.perPage}
      
      self.readCompanies(filter).then(response => {
        if(page > self.p){
          const url = new URL(response.config.url)
          self.p = url.searchParams.get("page")
          //
          self.companyList.push(...response.data.results)
          self.totalRows = response.data.count//response.data.results.length
          //self.currentPage = page
          console.log(self.companyList)
          self.lastPage = Math.ceil(response.data.count/self.offset)
          //self.currentPage = self.lastPage
        }
      }).catch(error => {
        console.error(error)
      })
    },
    setProcessFill(value = 0, color = false){
      if(value < 70 && !color){
        color = "#ff4081"
      }else if(value >= 70 && value < 90 && !color){
        color = "#ffa726"
      }else if(value >= 90 && !color){
        color = "#00b248"
      }

      return { color }
    },
    onSearch(search, loading) {
      loading(true);
      this.search(loading, search, this);
    },
    search(loading, search, vm){
      this.refreshToken().then(function(token){
        axios.get(`${conf.urlApi}/account/all?first_name=` + search, { headers: {"Authorization" : `Bearer ${token}`} }).then(response=>{
          vm.companyOptionsMembers = response.data.results
          loading(false)
        }).catch(error =>{
          console.error(error)
        })
      })
    },/* _.debounce((loading, search, vm) => {
      
      fetch(
        `https://api.github.com/search/repositories?q=${escape(search)}`
      ).then(res => {
        res.json().then(json => (vm.options = json.items));
        loading(false);
      });
      
    }, 350),*/
    addMembers(){

    },
    openCompany(record, index, event) {
      // 'record' will be the row data from items
      // `index` will be the visible row number (available in the v-model 'shownItems')
      console.log(record)
      this.$router.push({ path: `/dashboards/campaigns/${record.id}/tasks` })

    },
    onFiltered(filteredItems) {
      // Trigger pagination to update the number of buttons/pages due to filtering
      this.totalRows = filteredItems.length;
      this.currentPage = 1;
    },

    showModal(id = null) {
      let self = this
      if(id === null){
        this.modalTitle = "New Company"
        this.companyName = ""
        this.companyMembers = ""
        this.companyDescription = ""
        this.companyStatus = ""
        this.companyTheme = ""
        //
        this.readTaskTemplates()
        this.companyOptionsTaskTemplates = this.taskTemplates
      }else{
        self.readCompany(id).then(response=>{
          self.modalTitle = "Edit Company"
          self.companyId = id
          self.companyName = self.company.name
          self.companyMembers = self.company.members
          self.companyDescription = self.company.description
          self.companyStatus = self.company.status
          self.companyTheme = self.company.theme
        }).catch(error => {
          console.log(error)
        })
      }
      
      this.$root.$emit("bv::show::modal", "modalCompany", "#btnShow");
    },
    hideModal() {
      this.$root.$emit("bv::hide::modal", "modalCompany", "#btnShow");
    },
    toggleModal() {
      this.$root.$emit("bv::toggle::modal", "modalCompany", "#btnToggle");
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
    delCompany(companyId, row){
      let self = this
      self.deleteCompany(companyId).then(response => {
        //self.initCompanies()
        //self.companyList.unshift(response.data)
        //self.currentPage = 1
        //self.totalRows ++
        self.companyList = self.companyList.filter(function( company ) {
                            return company.id !== companyId
                        })
        self.totalRows--
      }).catch(error =>{
        console.error(error)
      })
    },
    handleSubmit() {
      let self = this

      if (!this.checkFormValidity()) {
        return
      }
      //
      let members = []
      self.companyMembers.forEach((member)=>{
        members.push(member.id)
      })

      if (self.modalTitle == "New Company"){
        let company = {
          name: self.companyName,
          user: self.profile.id,
          members: members,
          description: self.companyDescription,
          status: self.companyStatus,
          theme: self.companyTheme
        }
        
        self.createCompany(company).then(response => {
          self.companyOptionsTaskTemplates.forEach((task)=>{
            if(task.auto_join){
              task.company = response.data.id
              task.status = 1
              //
              if(task.hasOwnProperty("links")){
                let links = []
                task.links.forEach((l, i) => {
                  links.push(l.id)
                })
                task.links = links
              }
              //
              self.createTask(task).then(r => {}).catch(e => {
                console.error(e)
              })
            }
          })
          //self.initCompanies()
          self.companyList.unshift(response.data)
          self.currentPage = 1
          self.totalRows ++
        }).catch(error => {
          console.error(error)
        })        
      }else if (this.modalTitle == "Edit Company") {
        this.updateCompany({
          id: this.companyId,
          name: this.companyName,
          user: this.profile.id,
          members: members,
          description: this.companyDescription,
          status: this.companyStatus,
          theme: this.companyTheme
        }).then(response => {
          let index = self.companyList.findIndex(x => x.id == response.data.id)
          self.$set(self.companyList, index, response.data)
        }).catch(error => {
          console.error(error)
        })
      }
      
      self.$nextTick(() => {
        self.$bvModal.hide("modalCompany");
      })
    },
    initCompanies(){
      let self = this
      let filter = self.profile.role === "admin" ? {} : { user : this.profile.id}

      self.readCompanies(filter).then(response => {
        self.companyList = response.data.results
        self.totalRows = response.data.count//response.data.results.length
        //
        self.lastPage = Math.ceil(response.data.count/self.offset)
        //self.currentPage = self.lastPage
      }).catch(error => {
        console.error(error)
      })
    },
    /*
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
    */
  },
  mounted() {
    this.initCompanies()
  },
  created() {
    this.preset = preset
    this.util = util
  }
}
</script>

<style lang="scss">

/******************Custom styles************* */

.link-dashed {
  background-color: unset!important;
  border: none;
  color: #2196f3!important;
  border-bottom: 1px dashed #2196f3!important;
  padding: 1px;
  text-decoration: none;
}

.link-dashed:hover{
  background-color: unset!important;
  color: #024a85!important;
  border-bottom: 1px dashed #024a85!important;
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