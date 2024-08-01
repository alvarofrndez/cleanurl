import { ref } from 'vue'
import { defineStore } from 'pinia'
import { useGlobalStore } from '@/stores/global'
import { useToastStore } from '@/stores/toast'

export const useUserStore = defineStore('user', () => {

  const toast_s = useToastStore()
  const global_s = useGlobalStore()
  const API_URL = global_s.API_URL
  const user = ref()

  async function singin(name, email, password, confirm_password){
    // singin a user checking if the data is correct and return the status and message of the response
    const regex_password = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$/ 

    if(!regex_password.test(password)){
      toast_s.show('La contraseña debe tener 8 caracteres con letra y número', 'warning')
      return
    }

    if(password != confirm_password){
      toast_s.show('Las contraseñas no coinciden', 'warning')
      return
    }

    const response = await fetch(API_URL + 'singin', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify({
        name: name,
        email: email,
        password: password,
        password_confirmation: confirm_password
      })
    })

    if(!response.ok){
      if(response.status == 400){
        return {
          ok: false,
          message: 'error de credenciales'
        }
      }else{
        return {
          ok: false,
          message: 'Ha ocurrido un error'
        }
      }
    }

    switch (response.status){
      case 201:
        let data = await response.json()
        user.value = data.user

        setLocalToken(data)

        return {
          ok: true,
          message: 'bienvenido ' + user.value.email
        } 
      case 400:
        return {
          ok: false,
          message: 'error de credenciales'
        }
      case 500:
        return {
          ok: false,
          message: 'error del servidor'
        }
    }
  }

  async function login(email, password){
    // login a user checking if the data is correct and return the status and message of the response
    const response = await fetch(API_URL + 'login', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify({
        email: email,
        password: password
      })
    })

    if(!response.ok){
      return {
        ok: false,
        message: 'Ha ocurrido un error'
      }
    }
    const data = await response.json()

    if(data.status){
      user.value = data.user

      setLocalToken(data)

      return {
        ok: true,
        message: 'bienvenido ' + user.value.name
      }
    }else{
      return {
        ok: false,
        message: 'error de credenciales'
      }
    }
  }

  function setLocalToken(data){
    // set the token of the user to manteint the session
    localStorage.setItem('token', data.access_token);
  }

  async function logout(){
    // logout the user deleting the token from the localstorage
    const token = localStorage.getItem('token')

    const response = await fetch(API_URL + 'logout', {
      method: 'POST',
      headers: {
        'Authorization': 'Bearer ' + token,
        'Content-Type': 'application/json'
      }
    })

    if(response.ok){
      localStorage.removeItem('token')

      return {
        ok: true,
        message: 'hasta pronto ' + user.value.email
      }
    }else{
      return {
        ok: false,
        message: 'error al desloguear'
      }
    }
  }

  async function getActiveUser(){
    // get the the logged user if they are a loggued user
    const token = localStorage.getItem('token')

    if(!token){
      return false
    }

    const response = await fetch(API_URL + 'user', {
      method: 'GET',
      headers: {
        'Authorization': 'Bearer ' + token,
        'Content-Type': 'application/json'
      }
    })

    if(response.ok){
      const data = await response.json()
      user.value = data

      return true
    }else{
      return false
    }
  }

  async function checkStatus(){
    // check the status of the server and the database
    const response = await fetch(API_URL + 'checkStatus', {
      method: 'GET',
      headers: {
        'Content-Type': 'application/json'
      }
    })

    if(!response.ok){
      return false
    }

    return true
  }

  async function getAllUrls(page){
    // get akk the urls of the actual user with or not pagination
    const token = localStorage.getItem('token')

    const final_url = page ? API_URL + `getAllUrlsPaginated?page=${page}` : API_URL + `getAllUrls`

    const response = await fetch(final_url, {
      method: 'GET',
      headers: {
        'Authorization': `Bearer ${token}`,
        'Content-Type': 'application/json'
      }
    })

    if(!response.ok){
      return []
    }

    return await response.json()
  }

  async function deleteUrl(url){
    // delete a url from the database
    const token = localStorage.getItem('token')

    try {
      const response = await fetch(API_URL + `urls/${url.id}`, {
        method: 'DELETE',
        headers: {
        'Authorization': `Bearer ${token}`,
        'Content-Type': 'application/json'
        }
      })

      if (!response.ok)
        return false
        
      return true
    } catch (error) {
      return false
    }
  }

  return { user, singin, login, logout, getActiveUser, checkStatus, getAllUrls, deleteUrl }
})
