<template>

    <b-row>
        <b-col v-for="partner in partners" class="border-thick-solid border-light pt-1"
               v-bind:style=" $mq === 'lg' ? 'max-width: 12.5%;' : 'none'">
            <fv-premium-partner :service="partner"></fv-premium-partner>
        </b-col>
    </b-row>

</template>


<script>

    import PremiumPartner from "../Cards/PremiumPartner";

    const cache = {};
    export default {
        name: "fv-premium-partners",
        components: {FvPremiumPartner: PremiumPartner},

        data() {
            return {
                partners: [],
                perPage: 8,
            }
        },

        mounted() {
            this.getData()
        },

        methods: {
            async getData() {
                const url = `/api/partners?limit=${
                    this.perPage}`;
                let response;
                if (cache.hasOwnProperty(url)) {
                    response = cache[url];
                } else {
                    response = (await
                        this.$http.get(url)).data;
                    cache[url] = response;
                }
                this.partners = [...response.data];
            }
        }


    }
</script>