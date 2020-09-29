import axios from 'axios'
//axios.defaults.headers.common['Access-Control-Allow-Origin'] = '*'
//axios.defaults.headers.common['Access-Control-Allow-Headers'] = '*'

import conf from '../../configuration'
const state = { 
    companies: [],
    company: {},
}

const getters = { 
    companies: state => state.companies,
    company: state => state.company
}

const actions = { 
    async readCompany({commit}, id){
        return new Promise((resolve, reject) => {
            axios.get(`${conf.urlApi}/company/${id}/`).then(response=>{
                commit("readCompany", response.data)
                resolve(response)
            }).catch(error =>{
                console.error(error)
                reject(error)
            })
        })
      },
    /*
    async readCompanies({commit}, user = null){
        let filter = ""
        if(user!==null) filter = `?user=${user}`
        return new Promise((resolve, reject) => {
            axios.get(`${conf.urlApi}/company/${filter}`).then(response=>{
                commit("readCompanies", response.data.results)
                resolve(response)
            }).catch(error =>{
                console.error(error)
                reject(error)
            })
        })
    },
    */
    async readCompanies(context, filter = {}){
        let  url = new URL(`${conf.urlApi}/company/`)

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
                    context.commit("readCompanies", response.data.results)
                }
                resolve(response)
            }).catch(error =>{
                console.error(error)
                reject(error)
            })
        })
    },
    createCompany({commit}, company){
        return new Promise((resolve, reject) => {
            axios.post(`${conf.urlApi}/company/`, company)
                .then(response => {
                    //commit("createCompany", response.data)
                    resolve(response)
                })
                .catch(error => {
                    console.log(error)
                    reject(error)
                })
          })
      },
    /*
    async createCompany({commit}, company){
      const response = await axios.post(`${conf.urlApi}/company/`, company).then(response=>{
            commit("createCompany", response.data)
        }).catch(error =>{
            console.error(error)
        })
    },
    */
    async deleteCompany({commit}, id){
        return new Promise((resolve, reject) => {
            axios.delete(`${conf.urlApi}/company/${id}/`).then(response=>{
                //commit("deleteCompany", id)
                resolve(response)
            }).catch(error =>{
                console.error(error)
                reject(error)
            })
        })
    },

    async updateCompany({commit}, company){
        return new Promise((resolve, reject) => {
            axios.put(`${conf.urlApi}/company/${company.id}/`, company).then(response=>{
                commit("updateCompany", response.data)
                resolve(response)
            }).catch(error =>{
                console.error(error)
                reject(error)
            })
        })
    }
}

const mutations = {
    readCompany: (state, company) => (
        state.company = company
    ),
    readCompanies: (state, companies) => (
        state.companies = companies
    ),
    createCompany: (state, company) => state.companies.unshift(company),
    deleteCompany: (state, id) => (
        state.companies.filter(company => company.id !== id),
        state.companies.splice(company => company.id, 1)
    ),
    updateCompany: (state, company) => [...state.companies.filter(item => item.id !== company.id), company ],
};

export default {
    state,
    getters,
    actions,
    mutations
}