<script setup>
    import { ref } from 'vue'
    import { useRouter } from 'vue-router'
    import { useUserStore } from '@/stores/user'
    import { useToastStore } from '@/stores/toast'

    const router = useRouter()
    const user_s = useUserStore()
    const toast_s = useToastStore()

    const email = ref('')
    const password = ref('')

    async function login() {
        email.value = 'alvaro@gmail.com'
        password.value = '12345678aA_'
        const response = await user_s.login(email.value, password.value)

        if(response.ok){
            toast_s.show(response.message, 'success')
            router.push('/')
        }else{
            toast_s.show(response.message, 'error')
        }
    }

    function goTo(route){
        router.push(route)
    }
</script>

<template>
    <main>
        <h1>Login</h1>
        <form @submit.prevent='login'>
            <div>
                <label for='email'>Email</label>
                <input type='email' v-model='email' required />
            </div>
            <div>
                <label for='password'>Password</label>
                <input type='password' v-model='password' required />
            </div>
            <button type='submit'>Login</button>
        </form>
        <button @click="() => goTo('/singin')">registrarse</button>
    </main>
</template>
