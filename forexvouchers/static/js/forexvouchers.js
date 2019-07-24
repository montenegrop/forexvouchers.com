import Vue from 'vue/dist/vue.common'
import BootstrapVue from 'bootstrap-vue'
import rate from 'vue-rate'

Vue.use(BootstrapVue)
Vue.use(rate)
//Vue.config.devtools = true

const app = new Vue({
    delimiters: ['[[', ']]'],
    el: '#root',
    data: {
      message: 'Hello Vue!',
      tabIndex: 0,
      ...window.data
    },
     methods: {
      linkClass(idx) {
        if (this.tabIndex === idx) {
          return ['bg-primary', 'text-light']
        } else {
          return ['bg-light', 'text-info']
        }
      }
    }
  })

  const elems = document.querySelectorAll(".vue-init");

[].forEach.call(elems, function(el) {
    el.classList.remove("vue-init");
});