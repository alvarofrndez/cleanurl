<script setup>
    import { ref } from 'vue'
    import { useShorterStore } from '@/stores/shorter'
    import CardUrlComponent from '@/components/CardUrlComponent.vue'

    const shorter_s = useShorterStore()
    const url = ref()
    const result = ref({})

    async function shortURL(){
        const response = await shorter_s.shortUrl(url.value)

        if(response.ok){
            result.value = response.data
            url.value = ''
        }
    }
</script>

<template>
    <form class='contianer-shorter' @submit.prevent="shortURL">
        <h1>Introduzca la URL</h1>
        <input type='url' placeholder='https://dominio.com/url-a-acortar' v-model='url' required autocomplete='url'/>
        <button type='submit'>Obtener link</button>
        <div class='container-result' v-if="result.short_url">
            <CardUrlComponent :url='result.short_url'/>
        </div>
    </form>
</template>

<style scoped lang='scss'>
    @import '@/assets/style.scss';

    .contianer-shorter{
        // size
        width: 100%;
        height: 100%;

        // display
        @include flex(column, center, space-evenly, 4rem);

        // margin
        padding: 2rem;

        // decoration
        background-color: $h-c-blue-opacity-light;
        border-radius: 20px;
        box-shadow: 0px 0px 29px 2px $h-c-blue-opacity;

        input{
            // size
            width: 50%;

            // margin
            padding: .75rem;

            // decoration
            border-radius: 15px;
            border: none;
            outline: none;

            @media (max-width: 800px) {
                // size
                width: 70%;
            }

            @media (max-width: 400px) {
                // size
                width: 90%;
            }
        }

        .container-result{
            // size
            width: 300px;
            height: 200px;

            @media (max-height: 800px) {
                // size
                height: 150px;
            }
        }

        @media (max-height: 750px) {
            gap: 2rem;
        }
    }
</style>