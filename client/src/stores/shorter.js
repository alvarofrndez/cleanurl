import { defineStore } from 'pinia'
import { useGlobalStore } from '@/stores/global'

export const useShorterStore = defineStore('shorter', () => {

    const global_s = useGlobalStore()
    const API_URL = global_s.API_URL

    async function shortUrl(url){
        const response = await fetch(API_URL + 'shorten', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({ 
                original_url: url
            })
        })

        if (!response.ok) {
            return {
                ok: false,
                message: 'Ha ocurrido un error'
            }   
        }

        if(response){
            const data = await response.json()
            return {
                ok: true,
                message: 'URL acortada',
                data: data
            }   
        }
    }
    
    return{ shortUrl }
})