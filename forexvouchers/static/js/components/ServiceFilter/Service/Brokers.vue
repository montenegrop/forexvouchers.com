<template>
    <b-row>
        <b-col cols="12" md="6" v-for="service in services" v-bind:key="service.slug" class="service-summary mb-3">
            <fv-broker-card :toCompare="servicesForCompare" :key="`${service.name} card`" :service="service"
                             :selected="selected" v-on:serviceSelected="checkForCompare($event)"></fv-broker-card>
        </b-col>
    </b-row>
</template>

<script>

    import FvBrokerCard from './BrokerCard'

    export default {
        components: {FvBrokerCard},
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