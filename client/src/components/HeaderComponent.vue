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

        user_s.user = undefined
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
                <v-icon name='hi-solid-menu'/>
            </li>
            <li class='shorter' title='acortador'>
                <RouterLink to='/'>
                    <v-icon name='co-cut'/>
                </RouterLink>
            </li>
            <li class='analytics' title='analítica'>
                <RouterLink to='/analytics'>
                    <v-icon name='md-analytics-outlined'/>
                </RouterLink>
            </li>
            <li class='urls' title='mis urls'>
                <RouterLink to='/urls'>
                    <v-icon name='hi-solid-link'/>
                </RouterLink>
            </li>
            <v-icon name='hi-logout' class='logout' @click='logout' title='logout'/>
        </nav>
    </header>
</template>

<style scoped lang='scss'>
    @import '@/assets/style.scss';

    header{
        // size
        width: 39px;
        height: 40px;

        // position
        position: fixed;
        right: 20px;
        top: 20px;
        z-index: 10000;

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
            background-color: $h-c-blue;
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

            .urls, .shorter, .analitycs{
                *{
                    // size
                    width: 39px;
                }
            }

            *{
                // decoration
                cursor: pointer;
                text-decoration: none;
                color: $h-c-white !important;
            }
        }

        @media (max-width: 500px) {
            // size
            width: 200px;
            
            // position
            bottom: 20px;
            top: auto;
            right: auto;
        }
    }
</style>