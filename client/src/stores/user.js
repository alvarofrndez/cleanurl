import { ref } from 'vue'
import { defineStore } from 'pinia'
import { checkEmail, checkPassword } from '@/utilities/user'
import { useGlobalStore } from '@/stores/global'

export const useUserStore = defineStore('user', () => {

  const global_s = useGlobalStore()
  const API_URL = global_s.API_URL
  const user = ref()

  async function singin(name, email, password){
    if(!checkEmail){
      // TODO: toast el email debe tener...
      
      return
    }

    if(!checkPassword){
      // TODO: toast la contraseña debe tener...
      
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
        password_confirmation: password
      })
    })

    if(!response.ok){
      return {
        ok: false,
        message: 'Ha ocurrido un error'
      }
    }

    switch (response.status){
      case 201:
        let data = await response.json()
        console.log(data)
        user.value = data.user

        setLocalToken(data)
        // TODO: toast usuario insertado correctamente

        return {
          ok: true,
          message: 'bienvenido ' + user.value.email
        } 
      case 400:
        // TODO: mostrar error de validacion
        return {
          ok: false,
          message: 'error de credenciales'
        }
      case 500:
        // TODO: toast error interno del servidor
        return {
          ok: false,
          message: 'error del servidor'
        }
    }
  }

  async function login(email, password){
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

    if(response){
      const data = await response.json()
      user.value = data.user

      setLocalToken(data)
    }

    return {
      ok: true,
      message: 'bienvenido ' + user.value.name
    }
  }

  function setLocalToken(data){
    localStorage.setItem('token', data.access_token);
  }

  async function logout(){
    const token = localStorage.getItem('token')

    const response = await fetch(API_URL + 'logout', {
      method: 'POST',
      headers: {
        'Authorization': 'Bearer ' + token,
        'Content-Type': 'application/json'
      }
    })

    if(response.ok){
      const data = await response.json()

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

  async function checkServer(){
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

  return { user, singin, login, logout, getActiveUser, checkServer}
})
