import Vue from 'vue/dist/vue.common'
import BootstrapVue from 'bootstrap-vue'

Vue.use(BootstrapVue)

const app = new Vue({
    delimiters: ['[[', ']]'],
    el: '#root',
    data: {
      message: 'Hello Vue!',
      ...window.data
  }
  })

  const elems = document.querySelectorAll(".vue-init");

[].forEach.call(elems, function(el) {
    el.classList.remove("vue-init");
});