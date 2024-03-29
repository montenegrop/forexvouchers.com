import Vue from 'vue'
import BootstrapVue from 'bootstrap-vue'
import BootstrapVueIcons from 'bootstrap-vue'
import VueBootstrapTypeahead from 'vue-bootstrap-typeahead'
import rate from 'vue-rate'
import VueResource from 'vue-resource'
import components from './components'
import SocialSharing from 'vue-social-sharing'
import VueTimeago from 'vue-timeago'
import VueCookies from 'vue-cookies'
import VueCarousel from 'vue-carousel'
import ReadMore from 'vue-read-more'

import VueMq from 'vue-mq'

Vue.use(VueMq, {
    breakpoints: { // default breakpoints - customize this
        sm: 768,
        md: 1200,
        lg: Infinity,
    },
    defaultBreakpoint: 'sm' // customize this for SSR
})


Vue.use(ReadMore);
Vue.use(BootstrapVue)
Vue.use(BootstrapVueIcons)
Vue.use(VueResource)
Vue.use(VueCookies)
Vue.use(rate)
Vue.use(SocialSharing)
Vue.component('vue-bootstrap-typeahead', VueBootstrapTypeahead)
Vue.use(VueCarousel)
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
