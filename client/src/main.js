import { createApp } from 'vue'
import { createPinia } from 'pinia'

import App from './App.vue'
import router from './router'

// icons
import { OhVueIcon, addIcons } from 'oh-vue-icons'
import { FaUserAlt, HiLogout, CoCut, HiSolidLink, MdAnalyticsOutlined, HiSolidExternalLink, FaRegularCopy, MdDeleteoutline, BiDot, HiSolidMenu, FaShareAlt } from 'oh-vue-icons/icons'

addIcons(FaUserAlt, HiLogout, CoCut, HiSolidLink, MdAnalyticsOutlined, HiSolidExternalLink, FaRegularCopy, MdDeleteoutline, BiDot, HiSolidMenu, FaShareAlt )

// charts
import ECharts from 'vue-echarts'
import { use } from 'echarts/core'
import { CanvasRenderer } from 'echarts/renderers'
import { BarChart } from 'echarts/charts'
import { TitleComponent, TooltipComponent, GridComponent, LegendComponent } from 'echarts/components'

use([
  CanvasRenderer,
  BarChart,
  TitleComponent,
  TooltipComponent,
  GridComponent,
  LegendComponent 
])

const app = createApp(App)

app.component('v-icon', OhVueIcon)
app.component('v-chart', ECharts)

app.use(createPinia())
app.use(router)

app.mount('#app')
