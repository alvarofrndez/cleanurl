<script setup>
    import { ref, onMounted } from 'vue'
    import CardUrlComponent from '@/components/CardUrlComponent.vue'
    import LoaderComponent from '@/components/LoaderComponent.vue'
    import { useUserStore } from '@/stores/user'
    import { useToastStore } from '@/stores/toast'

    const user_s = useUserStore()
    const toast_s = useToastStore()
    const urls = ref([])
    const loaded = ref(false)
    const currentPage = ref(1);
    const totalPages = ref(1);
    const hasNextPage = ref(false);

    onMounted(() => {
        // TODO: continuar la paginacion pasando el numero de pagina por argumento a esta funcion
        fetchData(1)
    })

    async function fetchData(page){
        const response = await user_s.getAllUrls(page)

        urls.value = response
        console.log(urls.value)
        loaded.value = true
        currentPage.value = response.current_page
        totalPages.value = response.last_page
        hasNextPage.value = response.current_page < response.last_page
    }

    function changePage (page) {
      if (page >= 1 && page <= totalPages.value) {
        fetchData(page)
      }
    }
</script>

<template>
    <main v-if='loaded'>
        <section class='urls-container'> 
            <h1>Mis urls</h1>
            <div>
                <CardUrlComponent v-for='url of urls.data' :url='url' :key='url.id'/>
            </div>
            <div>
                <button @click="changePage(currentPage - 1)" :disabled="currentPage <= 1">Previous</button>
                <button @click="changePage(currentPage + 1)" :disabled="!hasNextPage">Next</button>
            </div>
        </section>
    </main>
    <LoaderComponent v-else/>
</template>

<style scoped lang='scss'>
    @import '@/assets/style.scss';

    main{
        // size
        width: 80%;
        height: 80%;

        // display
        @include flex();

        .urls-container{
            border: 1px solid black;
            // size
            width: 100%;
            height: 100%;
        
            // display
            @include flex(column, center, flex-start, 5rem);

            // margin
            padding: 2rem;

            div{
                // size
                width: 100%;

                // display
                display: grid;
                grid-template-columns: repeat(auto-fill, 300px);
                gap: 2rem;
            }
        }
    }
</style>
