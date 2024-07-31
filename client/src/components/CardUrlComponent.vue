<script setup>
    import { defineProps, onMounted, ref } from 'vue'
    import { useGlobalStore } from '@/stores/global'
    import { useUserStore } from '@/stores/user'

    const { url } = defineProps({
        url: {
            type: Object,
            required: true
        }
    })
    const global_s = useGlobalStore()
    const user_s = useUserStore()
    const is_active = ref(true)

    onMounted(() => {
        convertDate()
        // isActive()
    })

    function convertDate(){
        const date = new Date(url.created_at)
  
        const day = String(date.getDate()).padStart(2, '0')
        const month = String(date.getMonth() + 1).padStart(2, '0')
        const year = date.getFullYear()

        url.created_at = `${day}-${month}-${year}`
    }

    async function isActive(){
        const response = await fetch(url.original_url, {
            method: 'HEAD'
        })

        is_active.value = response.ok
    }
</script>

<template>
    <article class='container-url'>
        <span class='created-at'>{{ url.created_at }}</span>
        <!-- <span class='active' v-if='is_active'>activa</span>
        <span class='inactive' v-else>inactiva</span> -->
        <div>
            <h4>url acortada:</h4> 
            <a :href='global_s.API_URL + url.short_code'>{{ global_s.API_URL + url.short_code }}</a>
        </div>
        <div>
            <h4>url original:</h4> 
            <a :href='url.original_url'>{{ url.original_url }}</a>
        </div>
        <div>
            <h4>codigo acortado:</h4> 
            <span>{{ url.short_code }}</span>
        </div>
        <span class='created-by'>creada por: {{ url.user_email }}</span>
    </article>
</template>

<style scoped lang='scss'>
    @import '@/assets/style.scss';


    .container-url{
        border: 1px solid black;
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

        .created-by{
            // position
            position: absolute;
            right: .5rem;
            bottom: .5rem;

            // decoration
            color: $h-c-gray !important;
        }

        .active, .inactive{
            // position
            position: absolute;
            right: .5rem;
            top: 1rem;

            // decoration
            color: $h-c-gray !important;
        }
    }
</style>