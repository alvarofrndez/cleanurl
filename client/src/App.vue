<script setup>
  import HeaderComponent from '@/components/HeaderComponent.vue'
  import LoaderComponent from '@/components/LoaderComponent.vue'
  import ToastComponent from '@/components/ToastComponent.vue'
  import { useLoaderStore } from '@/stores/loader.js'
  import { useToastStore } from '@/stores/toast.js'

  const toast_s = useToastStore()
  const loader_s = useLoaderStore()
</script>

<template>
  <HeaderComponent/>
  <RouterView />
  <LoaderComponent v-if='loader_s.loading'/>
  <ToastComponent v-if='toast_s.showing'/>
</template>

<style lang='scss'>
    @import '/src/assets/style.scss';

</style>