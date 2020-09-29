<template>
  <div>
    <div>
      <Breadcrumbs />
    </div>
    <b-card title="Users" class="main-card mb-4">
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
              <font-awesome-icon class="mr-2" icon="plus" />Create User
            </b-button>
          </b-form-group>
        </b-col>
      </b-row>
      <!-- Main table element -->
      <b-table
        show-empty
        stacked="md"
        :items="users"
        :fields="fields"
        :current-page="currentPage"
        :per-page="perPage"
        :filter="filter"
        :sort-by.sync="sortBy"
        :sort-desc.sync="sortDesc"
        :sort-direction="sortDirection"
        @filtered="onFiltered"
        @row-clicked="openUser"
      >
        <template v-slot:cell(user_pic)="row" style="min-width:100px">
          <div class="avatar-wrapper avatar-wrapper-overlap d-flex">
            <div class="avatar-icon-wrapper avatar-icon-sm">
              <div class="avatar-icon" v-tooltip.top-center="row.item.username">
                <img :src="row.item.user_pic" alt />
              </div>
            </div>
          </div>
        </template>
        <template #cell(date_joined)="row">
          {{ row.item.date_joined.split('T')[0] }}
        </template>
        <template #cell(updated_on)="row">
          {{ row.item.updated_on.split('T')[0] }}
        </template>
        <template #cell(gender)="row">
          {{preset.getName(preset.user.gender, row.item.gender)}}
        </template>
        <template #cell(status)="row">
          {{preset.getName(preset.user.status, row.item.status)}}
        </template>
        <template #cell(role)="row">
          {{ row.item.role === '' ? 'user' : row.item.role }}
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
                  {{key}} : {{ value === '' ? 'user' : value }}
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
                <b-button size="sm" v-on:click="delUser(row.item.id)" class="btn-danger mx-1" >Delete</b-button>
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
      id="modalCompany"
      ref="modal"
      :title="modalTitle"
      @show="resetModal"
      @hidden="resetModal"
      @ok="handleOk"
    >
      <form ref="form" @submit.stop.prevent="handleSubmit">

        <div class="card vue-avatar-cropper-demo text-center">
          <div class="card-body">
            <img :src="userUserPic ? userUserPic : preset.user.default.user_pic.male" class="card-img avatar" />
            <div class="card-img-overlay">
              <button class="btn btn-primary btn-sm" id="pick-avatar">Select an new image</button>
            </div>
            <h5 class="card-title mb-0">{{ userFirstName ? userFirstName : ''  + ' ' + userSecondName ? userSecondName : '' }}</h5>
            <div class="text-muted">{{ userUsername ? userUsername : '' }}</div>
          </div>
          <div class="card-footer text-muted" v-html="stateUserPic"></div>
          <avatar-cropper
              @uploading="handleUploading"
              @uploaded="handleUploaded"
              @completed="handleCompleted"
              @error="handlerError"
              trigger="#pick-avatar"
              :labels="{ submit: 'Save', cancel: 'Cancel'}"
              upload-url="https://demo.overtrue.me/upload.php" />
        </div>
        <b-form-group
          :state="stateFirstName"
          label="First Name"
          label-for="first-name-input"
          invalid-feedback="First Name is required"
        >
          <b-form-input id="first-name-input" v-model="userFirstName" :state="stateFirstName" required></b-form-input>
        </b-form-group>
        <b-form-group
          :state="stateSecondName"
          label="Second Name"
          label-for="second-name-input"
          invalid-feedback="Second Name is required"
        >
          <b-form-input id="second-name-input" v-model="userSecondName" :state="stateSecondName" required></b-form-input>
        </b-form-group>
        <b-form-group
          :state="stateSecondName"
          label="Username"
          label-for="username-input"
          invalid-feedback="Username is required"
        >
          <b-form-input id="username-input" v-model="userUsername" :state="stateUsername" :disabled="modalTitle == 'New User' ? false : true" required></b-form-input>
        </b-form-group>
        <b-form-group
          :state="stateAbout"
          label="About"
          label-for="about-input"
          invalid-feedback="About is required"
        >
          <b-form-textarea id="about-input" v-model="userAbout" :state="stateAbout" required></b-form-textarea>
        </b-form-group>
        <b-form-group
          :state="statePhone"
          label="Phone"
          label-for="phone-input"
          invalid-feedback="Phone is required"
        >
          <b-form-input id="phone-input" v-model="userPhone" :state="statePhone" required></b-form-input>
        </b-form-group>
        <b-form-group
          :state="stateStatus"
          label="Status"
          label-for="status-input"
          invalid-feedback="Status is required"
        >
          <b-form-select id="status-input" v-model="userStatus" :state="stateStatus" :options="userOptionsStatus"></b-form-select>
        </b-form-group>
        <b-form-group
          :state="stateRole"
          label="Role"
          label-for="role-input"
          invalid-feedback="Role is required"
        >
          <b-form-select id="role-input" v-model="userRole" :state="stateRole" :options="userOptionsRole"></b-form-select>
        </b-form-group>

        <b-form-group
          :state="stateGender"
          label="Gender"
          label-for="gender-input"
          invalid-feedback="Gender is required"
        >
          <b-form-select id="gender-input" v-model="userGender" :state="stateGender" :options="userOptionsGender"></b-form-select>
        </b-form-group>

        <b-form-group
          :state="statePassword"
          label="Password"
          label-for="password-input"
          invalid-feedback="Password is required"
        >
          <b-form-input id="password-input" v-model="userPassword" :state="statePassword"></b-form-input>
        </b-form-group>
        <b-form-group
          :state="statePasswordRetype"
          label="Password Retype"
          label-for="password-retype-input"
          invalid-feedback="Password Retype is required"
        >
          <b-form-input id="password-retype-input" v-model="userPasswordRetype" :state="statePasswordRetype"></b-form-input>
        </b-form-group>
        <!--
        <b-form-group :state="membersState" label="Members" label-for="members-input">
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
            </div>
          </b-input-group>
        </b-form-group>
        -->
      </form>
    </b-modal>
  </div>
</template>

<script>
import Vue from 'vue'
import AvatarCropper from "vue-avatar-cropper"
import Breadcrumbs from "../components/Breadcrumbs"
import { mapGetters, mapActions } from "vuex"
import vSelect from "vue-select"
import conf from '../configuration'
import preset from '../preset'
import axios from 'axios'
import { library } from "@fortawesome/fontawesome-svg-core"
import { faStar, faPlus } from "@fortawesome/free-solid-svg-icons"
import { FontAwesomeIcon } from "@fortawesome/vue-fontawesome"
library.add(faStar, faPlus)

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
    key: "user_pic",
    label: "User Pic",
    sortable: true,
    sortDirection: "desc"
  },
  {
    key: "gender",
    label: "Gender",
    sortable: true,
    sortDirection: "desc"
  },
  {
    key: "user",
    label: "User",
    sortable: true,
    sortDirection: "desc"
  },
  {
    key: "first_name",
    label: "First Name",
    sortable: true,
    sortDirection: "desc"
  },
  {
    key: "last_name",
    label: "Second Name",
    sortable: true,
    sortDirection: "desc"
  },
  {
    key: "about",
    label: "About",
    sortable: true,
    sortDirection: "desc"
  },
  {
    key: "date_joined",
    label: "Date Joined",
    sortable: true,
    sortDirection: "desc"
  },
  {
    key: "updated_on",
    label: "Updated On",
    sortable: true,
    sortDirection: "desc"
  },
  {
    key: "phone",
    label: "Phone",
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
    key: "role",
    label: "Role",
    sortable: true,
    sortDirection: "desc"
  },
  { key: "showDetails", label: "Details" },
];
export default {
  components: {
    Breadcrumbs,
    "font-awesome-icon": FontAwesomeIcon,
    vSelect,
    AvatarCropper
  },
  data: () => ({
    modalTitle: null,

    preset: {},

    stateFirstName: null,
    stateSecondName: null,
    stateUsername: null,
    stateAbout: null,
    statePhone: null,
    stateGender: null,
    stateStatus: null,
    stateRole: null,
    stateUserPic: null,
    statePassword: null,
    statePasswordRetype: null,

    submittedNames: [],
    
    userId : null,
    userUserPic: null,
    userFirstName : null,
    userSecondName : null,
    userUsername : null,
    userAbout : null,
    userPhone : null,
    userGender: null,
    userStatus : null,
    userRole : null,
    userPassword : null,
    userPasswordRetype : null,

    userOptionsStatus: preset.user.status,
    userOptionsRole: preset.user.role,
    userOptionsGender: preset.user.gender,

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
    ...mapGetters(["profile", "users", "user"]),
  },
  methods: {
    ...mapActions([
      "readProfile",
      "readUsers",
      "readUser",
      "deleteUser",
      "createUser",
      "updateUser",
      "refreshToken",
    ]),
    onSearch(search, loading) {
      loading(true);
      this.search(loading, search, this);
    },
    search(loading, search, vm){
      this.refreshToken().then(function(token){
        axios.get(`${conf.urlApi}/account/all?first_name=` + search, { headers: {"Authorization" : `Bearer ${token}`} }).then(response=>{
          console.log("response.datas", response.data)
          vm.companyOptionsMembers = response.data
          loading(false);
        }).catch(error =>{
          console.error(error)
        })
      })
    },

    handleUploading(form, xhr) {
      let self = this
      let toBase64 = file =>
        new Promise((resolve, reject) => {
          let reader = new FileReader();
          reader.readAsDataURL(file);
          reader.onload = () => resolve(reader.result);
          reader.onerror = error => reject(error);
        });

      for (var pair of form.entries()) {
        console.log(pair[0], pair[1]);
        async function Main() {
          let encodedImage = await toBase64(pair[1]);
          console.log(encodedImage);
          self.userUserPic = encodedImage
        }
        Main();
      }

      this.stateUserPic = "uploading...";
    },
    handleUploaded(response) {
      if (response.status == "success") {
        this.userUserPic = response.url;
        // Maybe you need call vuex action to
        // update user avatar, for example:
        // this.$dispatch('updateUser', {avatar: response.url})
        this.stateUserPic = "user avatar updated.";
      }
    },
    handleCompleted(response, form, xhr) {
      this.stateUserPic = "upload completed.";
    },
    handlerError(message, type, xhr) {
      this.stateUserPic = "Oops! Something went wrong...";
    },


    openUser(record, index, event) {
      //this.$router.push({ path: `/dashboards/campaigns/${record.id}/tasks` })
    },
    onFiltered(filteredItems) {
      this.totalRows = filteredItems.length;
      this.currentPage = 1
    },
    delUser(userId){
      this.deleteUser(userId).then((response)=>{
        console.log(response)
      }).catch((error)=>{
        console.log(error)
      })
    },
    showModal(id = null) {
      let self = this
      if(id === null){
        this.modalTitle = "New User"

        this.userFirstName = null
        this.userSecondName = null
        this.userAbout = null
        this.userUsername = null
        this.userPhone = null
        this.userGender = null
        this.userStatus = null
        this.userRole = null
        self.userUserPic = null
      }else{
        this.readUser(id).then(response=>{
          console.log(id, response)
          self.modalTitle = "Edit User"

          self.userId = id

          self.userFirstName = self.user.first_name
          self.userSecondName = self.user.last_name
          self.userAbout = self.user.about
          self.userUsername = self.user.user
          self.userPhone = self.user.phone
          self.userStatus = self.user.gender
          self.userStatus = self.user.status
          self.userRole = self.user.role
          self.userUserPic = self.user.user_pic

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
      this.nameState = valid
      return valid
    },
    resetModal() {
      this.name = ""
      this.nameState = null
    },
    handleOk(bvModalEvt) {
      bvModalEvt.preventDefault();
      this.handleSubmit();
    },
    handleSubmit() {
      if (!this.checkFormValidity()) {
        return
      }
      //
      let members = []
      //
      let self = this
      if (this.modalTitle == "New User"){
        const user = {
          "username": self.userUsername,
          "password": self.userPassword,
          "description": self.userAbout,
          "first_name": self.userFirstName,
          "last_name": self.userSecondName,
          "phone": self.userPhone,
          "status": self.userStatus,
          "role": self.userRole
        }

        console.log("user", JSON.stringify(user))

        self.createUser(user).then(response => {
          console.log("createUser", response)
        }).catch(error => {
          console.error(error)
        })
      }
      //
      if (this.modalTitle == "Edit User") {
        const user = {
          "id": self.userId,
          "username": self.userUsername,
          "password": self.userPassword,
          "description": self.userAbout,
          "first_name": self.userFirstName,
          "last_name": self.userSecondName,
          "phone": self.userPhone,
          "status": self.userStatus,
          "role": self.userRole
        }

        console.log("user", JSON.stringify(user))

        this.updateUser(user).then(response => {
          console.log("createUser", response)
        }).catch(error => {
          console.error(error)
        })
      }

      this.$nextTick(() => {
        //this.$bvModal.hide("modalCompany");
      })
    },
    initUsers(){
      this.readUsers()
      this.totalRows = this.users.length
    }
  },
  mounted() {
    this.initUsers()
  },
  created() {
    this.preset = preset
    console.log(this.profile)
  },
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