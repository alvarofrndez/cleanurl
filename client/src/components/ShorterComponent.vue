<script setup>
    import { ref } from 'vue'
    import { useShorterStore } from '@/stores/shorter'

    const url = ref()
    const shorter_s = useShorterStore()
    const result = ref({})

    async function shortURL(){
        const response = await shorter_s.shortUrl(url.value)

        if(response.ok){
            console.log(response.data)
        }
    }
</script>

<template>
    <form class='contianer-shorter' @submit.prevent="shortURL">
        <h1>Introduzca la URL</h1>
        <input type='text' placeholder='https://dominio.com/url-a-acortar' v-model='url' required/>
        <button type='submit'>Obtener link</button>
        <div class='container-result' v-if="result.short_url"></div>
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