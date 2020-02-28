<template>


    <b-list-group horizontal>

        <b-list-group-item v-for="partner in partners" class="m-0 p-0 border-light">
            <fv-premium-partner :service="partner"></fv-premium-partner>
        </b-list-group-item>

    </b-list-group>

</template>


<script>

    import PremiumPartner from "../Cards/Broker/PremiumPartner";

    export default {
        name: "fv-premium-partners",
        components: {FvPremiumPartner: PremiumPartner},

        data() {
            return {
                partners: [],
                perPage: 8,
            }
        },


        computed: {
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