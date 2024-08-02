<script setup>
    import { ref, onMounted } from 'vue'
    import CardUrlComponent from '@/components/CardUrlComponent.vue'
    import LoaderComponent from '@/components/LoaderComponent.vue'
    import { useUserStore } from '@/stores/user'
    import { useToastStore } from '@/stores/toast'

    const user_s = useUserStore()
    const urls = ref([])
    const loaded = ref(false)
    const current_page = ref(1);
    const total_pages = ref(1);
    const has_next_page = ref(false);

    onMounted(() => {
        fetchData(1)
    })

    async function fetchData(page){
        // fetch the urls of the user with pagination
        const response = await user_s.getAllUrls(page)

        urls.value = response
        loaded.value = true
        current_page.value = response.current_page
        total_pages.value = response.last_page
        has_next_page.value = response.current_page < response.last_page
    }

    function changePage (page) {
      if (page >= 1 && page <= total_pages.value) {
        fetchData(page)
      }
    }
</script>

<template>
    <main v-if='loaded'>
        <section class='urls-container'> 
            <h1>Mis urls</h1>
            <div class='urls'>
                <CardUrlComponent v-for='url of urls.data' :url='url' :key='url.id'/>
            </div>
            <div class='container-buttons'>
                <button @click="changePage(current_page - 1)" :disabled="current_page <= 1">Anterior</button>
                <button @click="changePage(current_page + 1)" :disabled="!has_next_page">Siguiente</button>
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
        height: 90%;

        // display
        @include flex();

        .urls-container{
            // size
            width: 100%;
            height: 100%;

            // display
            @include flex(column, center, flex-start, 5rem);

            // margin
            padding: 2rem;

            .urls{
                // size
                width: 100%;

                // display
                display: grid;
                grid-template-columns: repeat(auto-fill, 300px);
                justify-content: center;
                gap: 3rem;

                &>*{
                    // size
                    height: 200px;

                    // decoration
                    background-color: $h-c-blue-opacity-light;
                }
            }

            .container-buttons{
                // position
                position: fixed;
                bottom: 2rem;
                z-index: 10;
                
                // display
                @include flex(row, center, center, 2rem);
                align-self: center;

                @media (max-width: 500px) {
                    // position
                    position: absolute;
                    bottom: auto;
                    top: 6rem;
                }
            }

            @media (max-width: 500px) {
                // margin
                padding: 0;
            }
        }

        @media (max-width: 500px) {
            // size
            width: 90%;
        }
    }
</style>
