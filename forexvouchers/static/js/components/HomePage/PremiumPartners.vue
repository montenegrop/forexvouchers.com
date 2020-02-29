<template>
    <div class="container">

        <b-list-group v-for="line in lines" horizontal>

            <b-list-group-item v-for="partner in partners.slice(line-1, line-1+perLine)"
                               class="m-0 p-0 border-thick border-light"
                             >
                <fv-premium-partner :service="partner"></fv-premium-partner>
            </b-list-group-item>

        </b-list-group>

    </div>
</template>


<script>

    import PremiumPartner from "../Cards/Broker/PremiumPartner";


    const cache = {};
    export default {
        name: "fv-premium-partners",
        components: {FvPremiumPartner: PremiumPartner},
        props: ["services"],

        data() {
            return {
                partners: [],
                perPage: 8,
            }
        },


        computed: {
            lines: function () {
                if (this.$mq === 'lg')
                    return 2 ** 0;
                else if (this.$mq === 'md')
                    return 2 ** 1;
                else
                    return 2 ** 2
            },
            perLine: function () {
                return Math.floor(this.perPage / this.lines)

            }
        }
        ,

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