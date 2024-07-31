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
        <CardUrlComponent v-for='url of urls' :url='url' :key='url.id'/>
    </main>
    <LoaderComponent v-else/>
</template>
