import axios from 'axios'
//axios.defaults.headers.common['Access-Control-Allow-Origin'] = '*'
//axios.defaults.headers.common['Access-Control-Allow-Headers'] = '*'

import conf from '../../configuration'
const state = { 
    tasks: [],
    taskTemplates: [],
    task: {},
};

const getters = { 
    taskTemplates: state => state.taskTemplates,
    tasks: state => state.tasks,
    task: state => state.task
}

const actions = {
    async readTask({commit}, id){
        return new Promise((resolve, reject) => {
            //const response = await 
            axios.get(`${conf.urlApi}/task/${id}/`).then(response=>{
                commit("readTask", response.data)
                resolve(response.data)
            }).catch(error =>{
                console.error(error)
                reject(error)
            })
        })
      },

    async readTaskTemplates({commit}){
        return new Promise((resolve, reject) => {
            axios.get(`${conf.urlApi}/task-template/`).then(response=>{
                if(response.data.results.length > 0){
                    commit("readTaskTemplates", response.data.results)
                }
                resolve(response)
            }).catch(error =>{
                console.error(error)
                reject(error)
            })
        })
    },

    async readTasks(context, filter = {}){
        let  url = new URL(`${conf.urlApi}/task/`)
        
        if(filter.hasOwnProperty("page")){ 
            filter.offset = filter.page * filter.limit - filter.limit
        }

        Object.entries(filter).forEach(([key, value]) => {
            url.searchParams.set(key, value)
        })

        return new Promise((resolve, reject) => {
            axios.get(url.toString()).then(response=>{
                if(response.data.results.length > 0){
                    filter.hasOwnProperty("page") ? response.data.results[0].page = filter.page : response.data.results[0].page = 1
                    context.commit("readTasks", response.data.results)
                }
                resolve(response)
            }).catch(error =>{
                console.error(error)
                reject(error)
            })
        })
    },

    async createTask({commit}, task){
      //const response = await 
      return new Promise((resolve, reject) => {
            axios.post(`${conf.urlApi}/task/`, task).then(response=>{
                commit("createTask", response.data.results)
                resolve(response)
            }).catch(error =>{
                console.error(error)
                reject(error)
            })
        })
    },
    
    async deleteTask({commit}, id){
        return new Promise((resolve, reject) => {
            axios.delete(`${conf.urlApi}/task/${id}/`).then(response=>{
                //commit("deleteTask", response.data.results)
                resolve(response)
            }).catch(error =>{
                console.error(error)
                reject(error)
            })
        })
    },

    async updateTask({commit}, task){
        const id = task.id
        return new Promise((resolve, reject) => {
            axios.put(`${conf.urlApi}/task/${id}/`, task).then(response=>{
                //console.log(response)
                //commit("updateTask", response.data)
                resolve(response)
            }).catch(error =>{
                console.error(error)
                reject(error)
            })
        })
    }
}

const mutations = {
    readTask: (state, task) => (
        state.task = task
    ),
    readTaskTemplates: (state, taskTemplates) => (
        state.taskTemplates = taskTemplates
    ),
    readTasks: (state, tasks) => state.tasks = tasks, //[...state.tasks, ...tasks],
    createTask: (state, task) => state.tasks.unshift(task),
    deleteTask: (state, id) => (
        state.tasks.filter(task => task.id !== id),
        state.tasks.splice(task => task.id, 1)
    ),
    updateTask: (state, task) => ([ ...state.tasks.filter(item => item.id !== task.id), ...task ] ),
    /*
    updateCompany: (state, company) => {
        let c =  [...state.companies.filter(item => item.id !== company.id), company ]
        //state.companies = c
        console.log(c)
        return c
    },
    */
};

export default {
    state,
    getters,
    actions,
    mutations
}