<script setup>
  import { useRouter } from 'vue-router'
  import { useUserStore } from '@/stores/user'
  import { useToastStore } from '@/stores/toast'

  const router = useRouter()
  const user_s = useUserStore()
  const toast_s = useToastStore()

  async function logout(){
    const response = await user_s.logout()

    if(response.ok){
        toast_s.show(response.message, 'success')

        user_s.user = {}
        router.push('/login')
    }else{
        toast_s.show(response.message, 'error')
    }
  }
</script>

<template>
    <header>
        <nav>
            <li class='user-profile'>
                <RouterLink to='/profile'>
                    <v-icon name='fa-user-alt'/>
                </RouterLink>
            </li>
            <li>
                <RouterLink to='/'>acortador</RouterLink>
            </li>
            <li>
                <RouterLink to='/urls'>urls</RouterLink>
            </li>
            <v-icon name='hi-logout' class='logout' @click='logout'/>
        </nav>
    </header>
</template>

<style scoped lang='scss'>
    @import '@/assets/style.scss';

    header{
        // size
        width: 40px;
        height: 40px;

        // position
        position: fixed;
        right: 20px;
        top: 20px;

        // display
        @include flex();

        // decoration
        overflow: hidden;
        border-radius: 20px;

        // transition
        transition: width .3s ease-in;
        
        &:hover{
            // size
            width: 200px;

            // transition
            transition: width .3s ease-in;
        }

        nav{
            background-color: $h-c-black-opacity;
            // size
            width: 100%;
            height: 100%;

            // display
            @include flex(row-reverse, center, space-between);

            // margin
            margin: 0;
            padding: 0;

            // decoration
            list-style: none;

            .user-profile, .logout{
                padding: 10px;
            }

            *{
                // decoration
                cursor: pointer;
                text-decoration: none;
            }
        }
    }
</style>