<template>
    <b-row>
        <b-col cols="12" md="4" v-for="voucher in vouchers" class="service-summary pb-3">
            <fv-voucher :key="voucher.id" :voucher="voucher" :show-clicks="true" :is-flex="isFlex"></fv-voucher>
        </b-col>
    </b-row>
</template>


<script>

    import index from "../Cards/VoucherSmall";

    const cache = {};
    export default {
        components: {FvVoucher: index},
        props: ['sort', 'isFlex'],
        data() {
            return {
                vouchers: [],
                perPage: 9,
            }
        },
        mounted() {
            this.getData();
        },
        methods: {
            async getData() {
                const url = `/api/vouchers?limit=${
                    this.perPage}&sort=${this.sort}`;
                let response;
                if (cache.hasOwnProperty(url)) {
                    response = cache[url];
                } else {
                    response = (await
                        this.$http.get(url)).data;
                    cache[url] = response;
                }

                this.vouchers = [...response.data];
            }
        }
    }
</script>