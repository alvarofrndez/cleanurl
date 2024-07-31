<script setup>
    import { ref } from 'vue'
    import { useShorterStore } from '@/stores/shorter'
    import { useGlobalStore } from '@/stores/global'

    const shorter_s = useShorterStore()
    const global_s = useGlobalStore()
    const url = ref()
    const result = ref({})

    async function shortURL(){
        const response = await shorter_s.shortUrl(url.value)

        if(response.ok){
            result.value = response.data
        }
    }
</script>

<template>
    <form class='contianer-shorter' @submit.prevent="shortURL">
        <h1>Introduzca la URL</h1>
        <input type='text' placeholder='https://dominio.com/url-a-acortar' v-model='url' required/>
        <button type='submit'>Obtener link</button>
        <div class='container-result' v-if="result.short_url">
            <span>{{ result.short_url.created_at }}</span>
            <span>{{ result.short_url.original_url }}</span>
            <span>{{ result.short_url.short_code }}</span>
            <span>{{ global_s.API_URL + result.short_url.short_code }}</span>
        </div>
    </form>
</template>

<style scoped lang='scss'>
    @import '@/assets/style.scss';

    .contianer-shorter{
        border: 1px solid black;
        // size
        width: 100%;
        height: 100%;

        // display
        @include flex(column, center, flex-start, 4rem);

        input{
            // size
            width: 50%;

            // margin
            padding: .5rem;
        }

    }
</style>