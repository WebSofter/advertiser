<template>
  <div id="loginPage">
    <div class="h-100 bg-plum-plate bg-animation">\
      <div class="h-100 justify-content-center align-items-center">
        <!--
        <div md="8" class="mx-auto text-center text-white">
          <h5>username/password for testing</h5>
          <ul style="list-style:none;">
            <li>advertiser/123456</li>
            <li>websofter/ws123456</li>
            <li>userman/us123456</li>
            <li>superman/sup123456</li>
          </ul>
        </div>
        -->
        <b-col md="8" class="mx-auto app-login-box">
          <div class="app-logo-inverse mx-auto mb-3" />
          <div class="modal-dialog w-100 mx-auto">
            <div class="modal-content" v-if="!loggedIn">
              <div class="modal-body">
                <div class="h5 modal-title text-center">
                  <h4 class="mt-2">
                    <div>Welcome back,</div>
                    <span>Please sign in to your account below.</span>
                  </h4>
                  <p class="text-center text-danger">
                    <ul>
                      <li v-for="(item, key, index) in errorMessages" :key="index">{{ item }}</li>
                    </ul>
                  </p>
                </div>
                <b-form-group
                  id="exampleInputGroup1"
                  label-for="exampleInput1"
                  description="We'll never share your email with anyone else."
                >
                  <b-form-input
                    id="exampleInput1"
                    v-model="username"
                    type="text"
                    required
                    placeholder="Enter username..."
                  ></b-form-input>
                </b-form-group>
                <b-form-group id="exampleInputGroup2" label-for="exampleInput2">
                  <b-form-input
                    id="exampleInput2"
                    v-model="password"
                    type="password"
                    required
                    placeholder="Enter password..."
                  ></b-form-input>
                </b-form-group>
                <b-form-checkbox v-model="isKeepLoged" @input="changeKeepLoged" name="check" id="exampleCheck">Keep me logged in</b-form-checkbox>
                <!--
                <div class="divider" />
                <h6 class="mb-0">
                  No account?
                  <a href="javascript:void(0);" class="text-primary">Sign up now</a>
                </h6>
                -->
              </div>
              <div class="modal-footer clearfix">
                <!--
                <div class="float-left">
                  <a href="javascript:void(0);" class="btn-lg btn btn-link"> Recover Password </a>
                </div>
                -->
                <div class="float-right">
                  <b-button variant="primary" size="lg" @click="authorization()">Login to Dashboard</b-button>
                </div>
              </div>
            </div>
            <div class="modal-content" v-else>
              <div class="modal-body">
                <h4>
                  You are logged in
                </h4>
                <div class="modal-footer clearfix">
                  <div class="float-right">
                    <b-button variant="danger" size="lg" @click="logout()">Logout</b-button>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="text-center text-white opacity-8 mt-3">Copyright &copy; ArchitectUI 2020</div>
        </b-col>
      </div>
    </div>
  </div>
</template>

<script>
import axios from "axios";
import { mapGetters, mapActions } from "vuex";

export default {
  data() {
    return {
      errorMessages:[],
      username: "",
      password: "",
      isKeepLoged: false,
    };
  },
  computed: {
    ...mapGetters([
      "loggedIn"
      //"accessToken", 
      //"refreshToken",
    ])
  },
  methods: {
    ...mapActions([
      "loginUser",
      "logoutUser",
      "registerUser",
      "refreshToken",
    ]),
    changeKeepLoged(){
      localStorage.setItem("isKeepLoged", this.isKeepLoged)
    },
    logout(){
      this.logoutUser()
    },
    authorization(){
      let self = this
      self.errorMessages = []
    
      if(self.username.length>=3){
        if(self.password.length>=3){
          if(self.loggedIn){
            self.errorMessages.push("You are logged")
          }else{
            self.loginUser({username: self.username, password: self.password}).then(response => {
              if(self.isKeepLoged){
                localStorage.setItem("keepLogedData", JSON.stringify({username: self.username, password: self.password}))
              }else{
                localStorage.setItem("keepLogedData", JSON.stringify({username: "", password: ""}))
              }
              self.$router.push({ path: "/" })
            })
            .catch(error=>{
              console.log(error)
              this.errorMessages.push("Login and password is not matched")
            })
          }
        }else{
          this.errorMessages.push("Empty password")
        }
      }else{
        this.errorMessages.push("Empty username")
      }
    }
  },
  mounted(){
    //this.loginUser({username: "websofter", password: "ws123456_"})

    console.log(this.loggedIn)
  },
  created(){
    this.isKeepLoged = localStorage.getItem("isKeepLoged") == 'true' ? true : false
    if(this.isKeepLoged && localStorage.getItem("keepLogedData")!==null) {
      let u = JSON.parse(localStorage.getItem("keepLogedData"))
      this.username = u.hasOwnProperty("username") ? u.username : ""
      this.password = u.hasOwnProperty("password") ? u.password : ""
    }
  }
};
</script>

<style lang="scss"></style>
