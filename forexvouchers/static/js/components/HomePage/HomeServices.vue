<template>

    <b-row>
        <b-col cols="12" md="4" v-for="service in brokers.slice(0, 9)" v-bind:key="service.slug" class="service-summary pb-3">
            <fv-broker-card :key="`${service.name} card`" :service="service"></fv-broker-card>
        </b-col>
    </b-row>


</template>


<script>

    import Broker from "../Cards/Broker/Broker";

    const cache = {};
    export default {
        components: {FvBrokerCard: Broker},
        data() {
            return {
                brokers: [],
                perPage: 10,
            }
        },
        mounted() {
            this.getData();
        },
        methods: {
            async getData() {
                const url = `/api/services?page=0&limit=${this.perPage}`;
                let response;
                if (cache.hasOwnProperty(url)) {
                    response = cache[url];
                } else {
                    response = (await
                        this.$http.get(url)).data;
                    cache[url] = response;
                }

                this.brokers = [...response.data];
            }
        }
    }
</script>

