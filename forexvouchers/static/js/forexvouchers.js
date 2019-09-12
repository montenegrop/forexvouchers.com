import Vue from 'vue'
import BootstrapVue from 'bootstrap-vue'
import VueBootstrapTypeahead from 'vue-bootstrap-typeahead'
import rate from 'vue-rate'
import VueResource from 'vue-resource'
import components from './components'
import SocialSharing from 'vue-social-sharing'
import VueTimeago from 'vue-timeago'
import VueCookies from 'vue-cookies'


Vue.use(BootstrapVue)
Vue.use(VueResource);
Vue.use(VueCookies);
Vue.use(rate)
Vue.use(SocialSharing)
Vue.component('vue-bootstrap-typeahead', VueBootstrapTypeahead)
Vue.config.devtools = true


Vue.use(VueTimeago, {
    name: 'Timeago',
    locale: 'en',
})

const app = new Vue({
    delimiters: ['[[', ']]'],
    components,
    el: '#root',
    data: {
        message: 'Hello Vue!',
        tabIndex: 0,
        ...window.data,
        selected: null,
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

[].forEach.call(elems, function (el) {
    el.classList.remove("vue-init");
});