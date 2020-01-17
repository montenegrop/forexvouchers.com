<template>
    <div class="row">
        <div v-for="service in services" v-bind:key="service.slug" class="service-summary col-md-6">
            <fv-service-card :toCompare="servicesForCompare" :key="`${service.name} card`" :service="service"
                             :selected="selected" v-on:serviceSelected="checkForCompare($event)"></fv-service-card>
        </div>
    </div>
</template>


<script>

    import FvServiceCard from './ServiceCard'

    export default {
        components: {FvServiceCard},
        props: ['services', 'selected'],

        methods: {
            checkForCompare($event) {
                this.$emit('serviceSelected', $event)
            },
            status(service) {
                return this.selected.includes(service.slug) ? service.slug : 'not-selected';
            },
        },
        computed: {
            servicesForCompare() {
                return this.services.filter(service => this.selected.includes(service.slug))
            }
        },
    }
</script>

