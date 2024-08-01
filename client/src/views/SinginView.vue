<script setup>
    import { ref } from 'vue'
    import { useRouter } from 'vue-router'
    import { useUserStore } from '@/stores/user'
    import { useToastStore } from '@/stores/toast'

    const user_s = useUserStore()
    const toast_s = useToastStore()
    const router = useRouter()
    const email = ref('')
    const name = ref('')
    const password = ref('')
    const confirm_password = ref('')

    async function singin() {
        const response = await user_s.singin(name.value, email.value, password.value, confirm_password.value)

        if(response)
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
    <h1>Registrarse</h1>
    <form @submit.prevent="singin" class='container-form'>
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
            <input type="password" v-model="confirm_password" required />
        </div>
        <article>
            <button type="submit">Registrarse</button>
            <button @click="() => goTo('/login')">Iniciar sesión</button>
        </article>
    </form>
  </main>
</template>

<style lang='scss'>
    @import '/src/assets/style.scss';

    @include loginLayout();
</style>