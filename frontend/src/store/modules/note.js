import axios from 'axios'
//axios.defaults.headers.common['Access-Control-Allow-Origin'] = '*'
//axios.defaults.headers.common['Access-Control-Allow-Headers'] = '*'

import conf from '../../configuration'
const state = { 
    notes: [],
    note: {},
}

const getters = { 
    notes: state => state.notes,
    note: state => state.note
}

const actions = { 
    async readNote({commit}, id){
        const response = await axios.get(`${conf.urlApi}/note/${id}/`).then(response=>{
            commit("readNote", response.data)
        }).catch(error =>{
            console.error(error)
        })
      },
    
    async readNotes(context, filter = {}){
        let  url = new URL(`${conf.urlApi}/note/`)
        
        if(filter.hasOwnProperty("page")){ 
            filter.offset = filter.page * filter.limit - filter.limit
        }
        
        Object.entries(filter).forEach(([key, value]) => {
            url.searchParams.set(key, value)
        })
        
        return new Promise((resolve, reject) => {
            console.log(url.toString())
            axios.get(url.toString()).then(response=>{
                if(response.data.results.length > 0){
                    filter.hasOwnProperty("page") ? response.data.results[0].page = filter.page : response.data.results[0].page = 1
                    context.commit("readNotes", response.data.results)
                }
                resolve(response)
            }).catch(error =>{
                console.error(error)
                reject(error)
            })
        })
    },
    /*
    async readNotes({commit}, task = null){
        let filter = ""
        if(task!==null) filter = `?task=${task}`;
        console.log(`${conf.urlApi}/note/${filter}`)
      const response = await axios.get(`${conf.urlApi}/note/${filter}`).then(response=>{
            commit("readNotes", response.data)
        }).catch(error =>{
            console.error(error)
        })
    },
    */
    async createNote({commit}, note){
      //const response = await 
      return new Promise((resolve, reject) => {
        axios.post(`${conf.urlApi}/note/`, note).then(response=>{
                commit("createNote", response.data)
                resolve(response)
            }).catch(error =>{
                console.error(error)
                reject(error)
            })
        })
    },
    
    async deleteNote({commit}, id){
        return new Promise((resolve, reject) => {
            axios.delete(`${conf.urlApi}/note/${id}/`).then(response=>{
                commit("deleteNote", id)
                resolve(response)
            }).catch(error =>{
                console.error(error)
                console.error(error)
            })
        })
    },

    async updateNote({commit}, note){
        const id = note.id
        return new Promise((resolve, reject) => {
            axios.put(`${conf.urlApi}/note/${id}/`, note).then(response=>{
                //commit("updateNote", response.data)
                //this.readNote(id)
                resolve(response)
            }).catch(error =>{
                console.error(error)
                reject(error)
            })
        })
    }
}

const mutations = {
    readNote: (state, note) => (
        state.note = note
    ),
    readNotes: (state, notes) => (
        state.notes = notes
    ),
    createNote: (state, note) => state.notes.unshift(note),
    deleteNote: (state, id) => (
        state.notes.filter(note => note.id !== id),
        state.notes.splice(note => note.id, 1)
    ),
    /*
    updateNote: (state, note) => ([
            ...state.notes.filter(item => item.id !== note.id),
            note
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