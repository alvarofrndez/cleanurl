<script setup>
    import { defineProps, onMounted, ref } from 'vue'
    import { useGlobalStore } from '@/stores/global'
    import { useUserStore } from '@/stores/user'
    import { useToastStore } from '@/stores/toast'

    const { url } = defineProps({
        url: {
            type: Object,
            required: true
        }
    })
    const global_s = useGlobalStore()
    const user_s = useUserStore()
    const toast_s = useToastStore()
    const is_active = ref(true)

    onMounted(() => {
        convertDate()
        // isActive()
    })

    function convertDate(){
        // convert the format of the date to dd-mm-yyyy
        const date = new Date(url.created_at)
  
        const day = String(date.getDate()).padStart(2, '0')
        const month = String(date.getMonth() + 1).padStart(2, '0')
        const year = date.getFullYear()

        url.created_at = `${day}-${month}-${year}`
    }

    async function isActive(){
        // check if the original url is active
        const response = await fetch(url.original_url, {
            method: 'HEAD'
        })

        is_active.value = response.ok
    }

    async function copy(){
        // copy the redirect url to the clipboard
        try {
            await navigator.clipboard.writeText(global_s.API_URL + url.short_code)
            toast_s.show('link copiado', 'success')
        } catch (err) {
            toast_s.show('error al copiar link', 'error')
        }
    }

    async function deleteUrl(){
        // delete the url from the database
        const response = await user_s.deleteUrl(url)

        if(response){
            document.getElementById(url.short_code).remove()
            toast_s.show('url borrada', 'success')
        }else{
            toast_s.show('error al borrar url', 'error')
        }
    }

    function share(){
        const message = `Visita este enlace: ${global_s.API_URL + url.short_code}`;
        const encoded_message = encodeURIComponent(message);
        const whatsapp_url = `https://api.whatsapp.com/send?text=${encoded_message}`;
        
        window.open(whatsapp_url, '_blank');
    }
</script>

<template>
    <article class='container-url' :id="url.short_code">
        <span class='created-at'>{{ url.created_at }}</span>
        <span class='clicks'>{{ url.clicks ? url.clicks : 0 }} {{url.clicks == 1 ? 'click' : 'clicks'}}</span>
        <v-icon class='active' v-if='is_active' name='bi-dot'/>
        <v-icon class='inactive' v-else name='bi-dot'/>
        <div class='container-data'>
            <div>
                <h4>url acortada:</h4> 
                <a :href='global_s.API_URL + url.short_code'>{{ global_s.API_URL + url.short_code }}</a>
            </div>
            <div>
                <h4>url original:</h4> 
                <a :href='url.original_url'>{{ url.original_url }}</a>
            </div>
        </div>
        <span class='created-by'>creada por: {{ url.user_email }}</span>
        <div class='container-options'>
            <a :href='url.original_url' target='_blank' title='ir al link'>
                <v-icon name='hi-solid-external-link'/>
            </a>
            <v-icon @click='copy' name='fa-regular-copy' title='copiar'/>
            <v-icon @click='share' name='fa-share-alt' title='compartir'/> 
            <v-icon @click='deleteUrl' name='md-deleteoutline' title='eliminar'/> 
        </div>
    </article>
</template>

<style scoped lang='scss'>
    @import '@/assets/style.scss';


    .container-url{
        // size
        width: 100%;
        height: 100%;

        // position
        position: relative;

        // display
        @include flex(column, flex-start, center, .5rem);

        // margin
        padding: .5rem;

        // decoration
        border-radius: 15px;
        overflow: hidden;

        .created-at{
            // position
            position: absolute;
            right: .5rem;
            top: .5rem;

            // decoration
            color: $h-c-gray !important;
        }

        .clicks{
            // position
            position: absolute;
            left: .5rem;
            top: .5rem;

            // decoration
            color: $h-c-gray !important;
        }

        .created-by{
            // size
            width: 50%;

            // position
            position: absolute;
            left: .5rem;
            bottom: .5rem;

            // decoration
            color: $h-c-gray !important;
        }

        .container-options{
            // position
            position: absolute;
            right: .5rem;
            bottom: .5rem;

            // display
            @include flex(row, flex-start, center, .5rem);
            
            *{
                // decoration
                cursor: pointer;
                transform: scale(1);

                // transition
                transition: transform .1s ease-in;

                &:hover{
                    transform: scale(1.1);

                    // transition
                    transition: transform .1s ease-in;
                }
            }
        }

        .active, .inactive{
            // position
            position: absolute;
            right: .5rem;
            top: 1.5rem;

            *{
                // decoration
                color: $h-c-green !important;
            }
        }

        .inactive{
            *{
                // decoration
                color: $h-c-red !important;
            }
        }

        .container-data{
            // display
            @include flex(column, flex-start, center, .5rem);
        }
    }
</style>