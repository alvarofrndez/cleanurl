<script setup>
  import { ref, onMounted } from 'vue'
  import HeaderComponent from '@/components/HeaderComponent.vue'
  import LoaderComponent from '@/components/LoaderComponent.vue'
  import ToastComponent from '@/components/ToastComponent.vue'
  import { useLoaderStore } from '@/stores/loader.js'
  import { useToastStore } from '@/stores/toast.js'
  import { useUserStore } from '@/stores/user.js'

  const toast_s = useToastStore()
  const loader_s = useLoaderStore()
  const user_s = useUserStore()
  const can_load = ref(0)

  onMounted(async () => {
    // check if the server is active
    can_load.value = await user_s.checkStatus() ? 1 : -1
  })
</script>

<template>
  <HeaderComponent v-if='can_load == 1 && user_s.user'/>
  <RouterView v-if='can_load == 1'/>
  <LoaderComponent v-if='can_load == 0' />
  <span v-if='can_load == -1'>No es posible establecer conexión con el servidor</span>
  <LoaderComponent v-if='loader_s.loading'/>
  <ToastComponent v-if='toast_s.showing'/>
</template>

<style lang='scss'>
    @import '/src/assets/style.scss';

</style>