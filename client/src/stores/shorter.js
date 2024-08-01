import { defineStore } from 'pinia'
import { useGlobalStore } from '@/stores/global'
import { useUserStore } from '@/stores/user' 

export const useShorterStore = defineStore('shorter', () => {

    const global_s = useGlobalStore()
    const user_s = useUserStore()
    const API_URL = global_s.API_URL

    async function shortUrl(url){
        // short the original url and return all the data of the url
        const token = localStorage.getItem('token')
        
        const response = await fetch(API_URL + 'shorten', {
            method: 'POST',
            headers: {
                'Authorization': `Bearer ${token}`,
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({ 
                original_url: url,
                user_email: user_s.user.email
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