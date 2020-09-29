import axios from 'axios'

//axios.defaults.headers.common['Access-Control-Allow-Origin'] = '*'
//axios.defaults.headers.common['Access-Control-Allow-Headers'] = '*'
//axios.defaults.headers.common['Content-type'] = 'Application/json'
//axios.defaults.headers.common['Access-Control-Allow-Methods'] = 'GET,PUT,POST,DELETE,PATCH,OPTIONS'

/*
axios.defaults.baseURL = 'http://crm.wsofter.ru:8000/';

const header = {
  headers:{
    'Authorization': "Bearer " + localStorage.getItem('JWTAccess')
  }
}
*/
//axios.defaults.baseURL = 'https://crm.wsofter.ru:4545';
//axios.defaults.timeout = 1500;

axios.defaults.xsrfCookieName = 'csrftoken'
axios.defaults.xsrfHeaderName = 'X-CSRFToken'
/*
'Access-Control-Allow-Headers': '*',
'Access-Control-Allow-Origin': '*',
*/
/*, {
  headers : {
    'Access-Control-Allow-Origin' : '*',
    'Content-type' : 'Application/json'
  }
}*/
import conf from '../../configuration'

export default { 
  state: {
    profile: {},
    user: {},
    users: [],
    accessToken: localStorage.getItem('access_token') || null, // makes sure the user is logged in even after
    // refreshing the page
    refreshToken: localStorage.getItem('refresh_token') || null,
    userId: localStorage.getItem('user_id') || null,
    AdPIData: '' // received data from the backend API is stored here.
  },
  getters: {
    loggedIn : state => state.accessToken != null,
    profile : state => state.profile,
    users:  state => state.users,
    user:  state => state.user,
  },
  mutations: {
    readUsers: (state, users) => (
      state.users = users
    ),
    updateProfile(state, profile){
      state.profile = profile
    },
    readUser(state, user){
      state.user = user
    },
    updateLocalStorage(state, { access, refresh }) {
      localStorage.setItem('access_token', access)
      localStorage.setItem('refresh_token', refresh)
      //
      if(access !== null){
        var base64Url = access.split('.')[1]
        var base64 = base64Url.replace(/-/g, '+').replace(/_/g, '/')
        var jsonPayload = decodeURIComponent(atob(base64).split('').map(function(c) {
            return '%' + ('00' + c.charCodeAt(0).toString(16)).slice(-2)
        }).join(''))
        let user = JSON.parse(jsonPayload)
        localStorage.setItem('user_id', user.user_id)
      }
      //
      state.accessToken = access
      state.refreshToken = refresh
    },
    updateAccess(state, access) {
      state.accessToken = access
    },
    destroyToken(state) {
      state.accessToken = null
      state.refreshToken = null
    }
  },
  actions: {
    /*
    async readUsers(context, condition = null){
      if(context.getters.loggedIn){
        context.dispatch("refreshToken").then(response => {
          axios.get(`${conf.urlApi}/account/all`, { headers: {"Authorization" : `Bearer ${context.state.accessToken}`} }).then(response=>{
            context.commit("readUsers", response.data)
          }).catch(error =>{
            console.error(error)
          })
        })
      }else{
        context.commit("readUsers", [])
      }
    },
    */
    async readUsers(context, condition = null){
      return new Promise((resolve, reject) => {
        if(context.getters.loggedIn){
          context.dispatch("refreshToken").then(response => {
            axios.get(`${conf.urlApi}/account/all`, { headers: {"Authorization" : `Bearer ${context.state.accessToken}`} }).then(response=>{
              context.commit("readUsers", response.data.results)
              resolve(response)
            }).catch(error =>{
              console.error(error)
              reject(error)
            })
          })
        }else{
          context.commit("readUsers", [])
        }
      })
    },
    async readUser(context, id){
      return new Promise((resolve, reject) => {
        context.dispatch("refreshToken").then(response => {
          axios.get(`${conf.urlApi}/account/${id}`, { headers: {"Authorization" : `Bearer ${context.state.accessToken}`} }).then(response=>{
            console.log("account/response.data", response.data)
              context.commit("readUser", response.data)
              resolve(response)
            }).catch(error =>{
              console.error(error)
              reject(error)
            })
        }).catch(error =>{
          console.error(error)
        })
      })
    },
    async readProfile(context, id = null){
      if(id === null){
        id = localStorage.getItem('user_id')
      }
      if(context.getters.loggedIn){
        context.dispatch("refreshToken").then(response => {
          //return new Promise((resolve, reject) => {
          axios.get(`${conf.urlApi}/account/${id}`, { headers: {"Authorization" : `Bearer ${context.state.accessToken}`} }).then(response=>{
              context.commit("updateProfile", response.data)
              //resolve(response)
            }).catch(error =>{
              console.error(error)
              //reject(error)
            })
          //})
        }).catch(error =>{
          console.error(error)
        })
      }else{
        context.commit("updateProfile", {})
      }
    },
    // run the below action to get a new access token on expiration
    async refreshToken(context) {
      return new Promise((resolve, reject) => {
        axios.post(conf.urlAuth + '/jwt/refresh/', {
          refresh: context.state.refreshToken
        }) // send the stored refresh token to the backend API
          .then(response => { // if API sends back new access and refresh token update the store
            context.commit('updateAccess', response.data.access)
            resolve(response.data.access)
          })
          .catch(err => {
            //console.log("refreshToken Error", err)
            /***********Переход на страницу авторизации********* */
            context.dispatch("logoutUser")
            this.$router.push({ path: "/pages/login" })
            reject(err) // error generating new access and refresh token because refresh token has expired
          })
      })
    },
    async createUser(context, user) {
      return new Promise((resolve, reject) => {
        axios.post(conf.urlAuth + '/users/', user, {
          refresh: context.state.refreshToken
        })
          .then(response => {
            resolve(response)
          })
          .catch(error => {
            console.error(error)
            reject(error)
          })
      })
    },
    async updateUser(context, user) {
      return new Promise((resolve, reject) => {
        axios.put(conf.urlApi + `/account/${ user.id }`, user, {
          refresh: context.state.refreshToken
        })
          .then(response => {
            resolve(response)
          })
          .catch(error => {
            console.error(error)
            reject(error)
          })
      })
    },
    async deleteUser(context, userId) {
      return new Promise((resolve, reject) => {
        axios.delete(conf.urlApi + `/account/${ userId }`, {
          refresh: context.state.refreshToken
        })
          .then(response => {
            resolve(response)
          })
          .catch(error => {
            console.error(error)
            reject(error)
          })
      })
    },
    async registerUser(context, data) {
      return new Promise((resolve, reject) => {
        axios.post('/register', {
          name: data.name,
          email: data.email,
          username: data.username,
          password: data.password,
          confirm: data.confirm
        })
          .then(response => {
            resolve(response)
          })
          .catch(error => {
            reject(error)
          })
      })
    },
    async logoutUser(context) {
      if (context.getters.loggedIn) {
        return new Promise((resolve, reject) => {
          localStorage.removeItem('access_token')
          localStorage.removeItem('refresh_token')
          context.commit('destroyToken')
          /*
          axios.post(conf.urlApi + '/token/logout/')
            .then(response => {
              localStorage.removeItem('access_token')
              localStorage.removeItem('refresh_token')
              context.commit('destroyToken')
            })
            .catch(err => {
              localStorage.removeItem('access_token')
              localStorage.removeItem('refresh_token')
              context.commit('destroyToken')
              resolve(err)
            })
            */
        })
      }
    },
    async loginUser(context, credentials) {
      return new Promise((resolve, reject) => {
        axios.post(conf.urlAuth + '/jwt/create', {
          username: credentials.username,
          password: credentials.password
        })
        .then(response => {
          context.commit('updateLocalStorage', { access: response.data.access, refresh: response.data.refresh }) // store the access and refresh token in localstorage
          resolve(response)
        })
        .catch(error => {
          console.log(error)
          reject(error)
        })
      })
    }
  }
}