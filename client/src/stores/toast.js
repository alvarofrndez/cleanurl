import { defineStore } from 'pinia'
import { ref } from 'vue'

export const useToastStore = defineStore('toast', () => {

    let text = ref('')
    let icon = ref('')
    let showing = ref(false)

    function show(text_, icon_){
        // show the toast whit the message and the icon
        text.value = text_
        icon.value = icon_
        showing.value = true

        setTimeout(() => {
            showing.value = false
        },[3000])
    }
    
    return{text, icon, showing, show}
})