import axios from 'axios'
//axios.defaults.headers.common['Access-Control-Allow-Origin'] = '*'
//axios.defaults.headers.common['Access-Control-Allow-Headers'] = '*'

import conf from '../../configuration'
const state = { 
    links: [],
    link: {},
};

const getters = { 
    links: state => state.links,
    link: state => state.link
}

const actions = { 
    async readLink({commit}, id){
        return new Promise((resolve, reject) => {
            axios.get(`${conf.urlApi}/link/${id}/`).then(response=>{
                commit("readLink", response.data.results)
                resolve(response)
            }).catch(error =>{
                console.error(error)
                reject(error)
            })
        })
      },
    async readLinks({commit}, filter = {}){
        let  url = new URL(`${conf.urlApi}/link/`)
        
        if(filter.hasOwnProperty("page")){ 
            filter.offset = filter.page * filter.limit - filter.limit
        }
        
        Object.entries(filter).forEach(([key, value]) => {
            url.searchParams.set(key, value)
        })

        return new Promise((resolve, reject) => {
            axios.get(url.toString()).then(response=>{
                //commit("readLinks", response.data.results)
                resolve(response)
            }).catch(error =>{
                console.error(error)
                reject(error)
            })
        })
    },
    /*
    async createLink({commit}, link){
      const response = await axios.post(`${conf.urlApi}/link/`, link).then(response=>{
            commit("createLink", response.data)
        }).catch(error =>{
            console.error(error)
        })
    },
    */
   createLink({commit}, link){
        return new Promise((resolve, reject) => {
            axios.post(`${conf.urlApi}/link/`, link)
            .then(response => {
                commit("createLink", response.data.results)
                resolve(response)
            })
            .catch(error => {
                console.error(error)
                reject(error)
            })
        })
    },
    async deleteLink({commit}, id){
        return new Promise((resolve, reject) => {
            axios.delete(`${conf.urlApi}/link/${id}/`).then(response=>{
                commit("deleteLink", id)
                resolve(response)
            }).catch(error =>{
                console.error(error)
                reject(error)
            })
        })
    },

    async updateLink({commit}, link){
        const id = link.id
        return new Promise((resolve, reject) => {
            axios.put(`${conf.urlApi}/link/${id}/`, link).then(response=>{
                commit("updateLink", response.data)
            }).catch(error =>{
                console.error(error)
            })
        })
    }
}

const mutations = {
    readLink: (state, link) => (
        state.link = link
    ),
    readLinks: (state, links) => (
        state.links = links
    ),
    createLink: (state, link) => state.links.unshift(link),
    deleteLink: (state, id) => (
        state.links.filter(link => link.id !== id),
        state.links.splice(link => link.id, 1)
    ),
    updateLink: (state, link) => ([
            ...state.links.filter(item => item.id !== link.id),
            link
         ]

    ),
};

export default {
    state,
    getters,
    actions,
    mutations
}