<script setup>
  import ShorterComponent from '@/components/ShorterComponent.vue'

</script>

<template>
  <main>
    <ShorterComponent/>
  </main>
</template>

<style scoped lang='scss'>
  @import '@/assets/style.scss';

  main{
    // size
    width: 60%;
    height: 60%;

    // display
    @include flex();

    @media (max-width: 1000px) {
      // size
      width: 70%;
    }

    @media (max-height: 850px) {
      // size
      height: 70%;
    }
  }

</style>