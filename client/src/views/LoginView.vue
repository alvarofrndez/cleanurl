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
        <h1>Iniciar sesión</h1>
        <form @submit.prevent='login' class='container-form'>
            <div>
                <label for='email'>Email</label>
                <input type='email' v-model='email' required autocomplete='email'/>
            </div>
            <div>
                <label for='password'>Contraseña</label>
                <input type='password' v-model='password' required />
            </div>
            <article>
                <button type='submit'>Iniciar sesión</button>
                <button @click="() => goTo('/singin')">Registrarse</button>
            </article>
        </form>
    </main>
</template>

<style lang='scss'>
    @import '/src/assets/style.scss';

    @include loginLayout();
</style>