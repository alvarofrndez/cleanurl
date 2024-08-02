<script setup>
    import { ref, onMounted } from 'vue'
    import LoaderComponent from '@/components/LoaderComponent.vue'
    import { useUserStore } from '@/stores/user'
    import { useRouter } from 'vue-router'

    const user_s = useUserStore()
    const router = useRouter()
    const urls = ref([])
    const clicks = ref([])
    const urls_names = ref([])
    const loaded = ref(false)

    // chart data
    let chart_options = ref({
        title: {
            text: 'Contador de Clicks'
        },
        tooltip: {},
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

    function goTo(){
        router.push('/')
    }
</script>

<template>
    <main v-if='loaded'>
        <section class='chart-container' v-if='urls.length > 0'>
            <v-chart :option="chart_options" ></v-chart>
        </section>
        <section v-else class='not-urls' >
            <h3>No tienes urls todavia</h3>
            <button @click='goTo()'>Crear url</button>
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
            // size
            width: 60%;
            height: 40%;

            // display
            @include flex(column, center, space-evenly);

            @media (max-width: 850px) {
                // size
                width: 80%;
                height: 60%;
            }

            @media (max-width: 550px) {
                // size
                width: 90%;
                height: 80%;
            }

            @media (max-width: 400px) {
                // size
                width: 100%;
            }
            
            .echarts{
                div{
                    // size
                    width: 100% !important;
                    height: 100% !important;
                }
            }
        }

        .not-urls{
            // size
            width: 100%;
            height: 100%;

            // display
            @include flex(column, center, center, 2rem);
        }
    }
</style>
