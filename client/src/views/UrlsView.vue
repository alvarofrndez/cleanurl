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

    onMounted(async () => {
        const response = await user_s.getAllUrls()

        urls.value = response
        loaded.value = true
    })
</script>

<template>
    <main v-if='loaded'>
        <section class='urls-container'> 
            <h1>Mis urls</h1>
            <div>
                <CardUrlComponent v-for='url of urls' :url='url' :key='url.id'/>
            </div>
        </section>
    </main>
    <LoaderComponent v-else/>
</template>

<style scoped lang='scss'>
    @import '@/assets/style.scss';

    main{
        // size
        width: 90%;
        height: 100%;

        // display
        @include flex(column, center, center, 3rem);

        .urls-container{
            border: 1px solid black;
            // size
            width: 100%;
        
            // display
            @include flex(column, center, center, 2rem);

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
