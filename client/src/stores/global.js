import { defineStore } from 'pinia'

export const useGlobalStore = defineStore('global', () => {

    let API_URL = 'http://localhost:8000/api/'
    
    return{ API_URL }
})