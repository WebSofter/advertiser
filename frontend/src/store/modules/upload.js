import axios from 'axios'
//axios.defaults.headers.common['Access-Control-Allow-Origin'] = '*'
//axios.defaults.headers.common['Access-Control-Allow-Headers'] = '*'

import conf from '../../configuration'
const state = { 
    uploads: [],
    upload: {},
};

const getters = { 
    uploads: state => state.uploads,
    upload: state => state.upload
};

const actions = { 
    async readUpload({commit}, id){
        return new Promise((resolve, reject) => {
            axios.get(`${conf.urlApi}/upload/${id}/`).then(response=>{
                commit("readUpload", response.data)
                resolve(response)
            }).catch(error =>{
                console.error(error)
                reject(error)
            })
        })
      },
      async readUploads(context, filter = {}){
        let  url = new URL(`${conf.urlApi}/upload/`)
        
        if(filter.hasOwnProperty("page")){ 
            filter.offset = filter.page * filter.limit - filter.limit
        }
        
        Object.entries(filter).forEach(([key, value]) => {
            console.log(key, value)
            url.searchParams.set(key, value)
        })

        return new Promise((resolve, reject) => {
            axios.get(url.toString() ).then(response=>{
                if(response.data.results.length > 0){
                    filter.hasOwnProperty("page") ? response.data.results[0].page = filter.page : response.data.results[0].page = 1
                    context.commit("readUploads", response.data.results)
                }
                resolve(response)
            }).catch(error =>{
                console.error(error)
                reject(error)
            })
        })
    },
    /*
    async readUploads({commit}, task = null){
        let filter = ""
        if(task!==null) filter = `?task=${task}`;
        console.log(`${conf.urlApi}/upload/${filter}`)
      const response = await axios.get(`${conf.urlApi}/upload/${filter}`).then(response=>{
            commit("readUploads", response.data)
        }).catch(error =>{
            console.error(error)
        })
    },
    */
    async createUpload({commit}, upload){
      //const response = await 
      return new Promise((resolve, reject) => {
        axios.post(`${conf.urlApi}/upload/`, upload ).then(response=>{
                commit("createUpload", response.data)
                resolve(response)
            }).catch(error =>{
                console.error(error)
                reject(error)
            })
        })
    },
    
    async deleteUpload({commit}, id){
      await axios.delete(`${conf.urlApi}/upload/${id}/` ).then(response=>{
            commit("deleteUpload", id)
        }).catch(error =>{
            console.error(error)
        })
    },

    async updateUpload({commit}, upload){
        const id = upload.id
        return new Promise((resolve, reject) => {
            axios.put(`${conf.urlApi}/upload/${id}/`, upload ).then(response=>{
                //commit("updateUpload", response.data)
                //this.readUpload(id)
                resolve(response)
            }).catch(error =>{
                console.error(error)
                reject(error)
            })
        })
    }
}

const mutations = {
    readUpload: (state, upload) => (
        state.upload = upload
    ),
    readUploads: (state, uploads) => (
        state.uploads = uploads
    ),
    createUpload: (state, upload) => state.uploads.unshift(upload),
    deleteUpload: (state, id) => (
        state.uploads.filter(upload => upload.id !== id),
        state.uploads.splice(upload => upload.id, 1)
    ),
    /*
    updateUpload: (state, upload) => ([
            ...state.uploads.filter(item => item.id !== upload.id),
            upload
         ]

    ),
    */
};

export default {
    state,
    getters,
    actions,
    mutations
}