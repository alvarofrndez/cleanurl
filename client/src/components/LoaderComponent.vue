<script setup>

</script>

<template>
    <div class='container-circle'>
        <span class='circle'></span>
    </div>
</template>

<style scoped lang='scss'>
    @import '@/assets/style.scss';

    .container-circle{
        // size
        width: 100%;
        min-height: 80vh;

        // display
        @include flex();

        // margin
        margin: 0;

        // decoration
        background-color: transparent;
        transform: translateY(-1rem);

        .circle{
            // size
            width: 30px;
            height: 30px;

            // decoration
            border: 3px solid transparent;
            border-top: 3px solid $h-c-black;
            border-radius: 50%;

            // animation
            animation: spin 1s ease-in-out infinite;

            @keyframes spin {
                0% { transform: rotate(0deg); }
                100% { transform: rotate(360deg); }
            }
        }
    }
</style>