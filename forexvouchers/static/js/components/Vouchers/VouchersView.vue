<template>
    <div>
        <b-row>
            <b-col cols="4" class="vouchers-menu">
                <fv-filter-service :options="filterServices" :onChange="onServiceChange"></fv-filter-service>
                <fv-filter-type :selected="type" :onChange="onTypeChange"></fv-filter-type>
                <fv-filter-category :options="filterCategories" :onChange="onCategoryChange"></fv-filter-category>
            </b-col>
            <b-col cols="8">
                <fv-list :vouchers="vouchers"/>
            </b-col>
        </b-row>
    </div>
</template>

<script>

    import FvList from './VouchersList'
    import FvFilterType from './VouchersFilterType'
    import FvFilterService from './VouchersFilterService'
    import FvFilterCategory from './VouchersFilterCategory'

    export default {
        name: "fv-vouchers-view",
        components: {FvList, FvFilterType, FvFilterService, FvFilterCategory},
        props: [],
        data() {
            return {
                type: 'discount,promocode,offer',
                filterServices: [],
                services: '',
                filterCategories: [],
                categories: '',
                vouchers: [],
            }
        },
        watch: {
            type: function () {
                this.getData();
            },
            services: function () {
                this.getData();
            },
            categories: function () {
                this.getData();
            },
        },
        mounted() {
            this.getData()
        },
        methods: {
            async getData() {
                const url = `/api/vouchers?voucher_types=${this.type}&services=${this.services}&categories=${this.categories}`;
                let response = await this.$http.get(url);
                this.vouchers = response.body.data;
                this.filterServices = response.body.services;
                this.filterCategories = response.body.categories;
            },

            onTypeChange(value) {
                this.type = value.join(',')
            },
            onServiceChange(value) {
                this.services = value.join(',')
            },
            onCategoryChange(value) {
                this.categories = value.join(',')
            },
        },
    }
</script>