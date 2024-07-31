<script setup>
    import { ref, onMounted } from 'vue'
    import LoaderComponent from '@/components/LoaderComponent.vue'
    import { useUserStore } from '@/stores/user'
    import { useToastStore } from '@/stores/toast'

    const user_s = useUserStore()
    const toast_s = useToastStore()
    const urls = ref([])
    const clicks = ref([])
    const urls_names = ref([])
    const loaded = ref(false)

    let chart_options = ref({
        title: {
            text: 'Contador de Clicks'
        },
        tooltip: {},
        legend: {
            data: ['Clicks']
        },
        xAxis: {
            type: 'category',
            data: []
        },
        yAxis: {
            type: 'value'
        },
        series: [
            {
            name: 'Clicks',
            type: 'bar',
            data: []
            }
        ]
    })

    onMounted(async () => {
        const response = await user_s.getAllUrls()

        urls.value = response
        loaded.value = true

        setChartOptions()
    })

    async function setChartOptions() {
        if(loaded.value){
            urls_names.value =  urls.value.map(item => item.short_code)
            clicks.value = urls.value.map(item => item.clicks)

            chart_options.value.xAxis.data = urls_names.value
            chart_options.value.series[0].data = clicks.value
        }
    }
</script>

<template>
    <main v-if='loaded'>
        <section class='chart-container'>
            <h1>Analisis</h1>
            <v-chart :option="chart_options" style="width: 600px;height:400px;"></v-chart>
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

        .chart-container{
            // display
            @include flex(column, center, center, 1rem);
        }
    }
</style>
