//import Vue from 'vue'
import Vue from 'vue/dist/vue'
import BootstrapVue from 'bootstrap-vue'

Vue.use(BootstrapVue)

const app = new Vue({
    delimiters: ['[[', ']]'],
    el: '#root',
    data: {
      message: 'Hello Vue!'
    }
  })
