<script setup>
    import { ref } from 'vue'
    import { useRouter } from 'vue-router'
    import { useUserStore } from '@/stores/user'

    const user_s = useUserStore()
    const router = useRouter()
    const email = ref('')
    const name = ref('')
    const password = ref('')
    const confirm_password = ref('')

    async function login() {
        const response = await user_s.singin(email.value, name.value, password.value, confirm_password.value)

        if(response.ok){
            // TODO: toast bienvenido
            console.log(response.message)
            router.push('/')
        }else{
            // TODO: toast error
            console.log(response.message)
        }
    }

    function goTo(route){
        router.push(route)
    }
</script>

<template>
  <main>
    <h1>Singin</h1>
    <form @submit.prevent="login">
        <div>
            <label for="email">Email</label>
            <input type="email" v-model="email" required />
        </div>
        <div>
            <label for="name">Nombre</label>
            <input type="name" v-model="name" required />
        </div>
        <div>
            <label for="password">Contraseña</label>
            <input type="password" v-model="password" required />
        </div>
        <div>
            <label for="confirm_password">Confirmar contraseña</label>
            <input type="confirm_password" v-model="confirm_password" required />
        </div>
        <button type="submit">Singin</button>
    </form>
    <button @click="() => goTo('/login')">iniciar sesion</button>
  </main>
</template>
