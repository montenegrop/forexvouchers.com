<template>
    <div>

        

        <fv-filter-type :selected="types" :onChange="onTypeChange"></fv-filter-type>
        <fv-list :vouchers="vouchers"/>

    </div>
</template>

<script>

    import FvList from './VouchersList'
    import FvFilterType from './VouchersFilterType'

    export default {
        name: "fv-vouchers-view",
        components: {FvList, FvFilterType},
        props: [],
        data() {
            return {
                type: 'discount,promocode,offer',
                vouchers: [],
            }
        },
        watch: {
            type: function () {
                this.getData();
            },
        },
        mounted() {
            this.getData()
        },
        methods: {
            async getData() {
                const url = `/api/vouchers?voucher_types=${this.type}`;
                let response = await this.$http.get(url);
                this.vouchers = response.body.data;
                return response
            },

            onTypeChange(value) {
                this.type = value.join(',')
            },
        },
    }
</script>