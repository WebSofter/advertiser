import Vue from 'vue'
import Vuex from 'vuex'
//import axios from 'axios'
//import conf from '../configuration'
//import router from '../router/index'
import company from './modules/company'
import task from './modules/task'
import note from './modules/note'
import user from './modules/user'
import link from './modules/link'
import upload from './modules/upload'
import createPersistedState from 'vuex-persistedstate'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
  },
  mutations: {
  },
  actions: {
  },
  modules: {
    company,
    user,
    task,
    note,
    link,
    upload
  },
  plugins: [createPersistedState({
    key: 'store',
    storage: window.localStorage         
 })]
})