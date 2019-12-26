<template>
    <div>
        <h2 class="filter-titles filter-titles-main">Search for Discounts, Offers and PromoCodes:</h2>
        <b-row>
            <b-col md="3" class="vouchers-menu vouchers-menu-margin-top">
                <fv-filter-service :options="filterServices" :onChange="onServiceChange"></fv-filter-service>
                <fv-filter-type :tipos="filterTypes" :onChange="onTypeChange"></fv-filter-type>
                <fv-filter-category :options="filterCategories" :onChange="onCategoryChange"></fv-filter-category>
            </b-col>
            <b-col md="9">
                <div>
                    <div style="float: left;">
                        <FvLetterFilter :options="vouchers.map(voucher => ({text: voucher.name}))"
                                        v-on:clickLetter="onLetterFilter($event)" :selected="startingLetter"/>
                    </div>
                    <div style="float: right;">
                        <FvSort v-on:sortedBy="onSortChange($event)"/>
                    </div>
                </div>

                <div>
                    <div>
                        <FvList :vouchers="vouchers.filter(voucher => (voucher.name.charAt(0).toLocaleUpperCase() == startingLetter || startingLetter == '' ) )"/>
                    </div>
                    <div class="show-more">
                        <a href="#" @click.stop.prevent="limit += 10">show more</a>
                    </div>
                </div>
            </b-col>
        </b-row>
    </div>
</template>

<script>

    import FvList from './VouchersList'
    import FvFilterType from './VouchersFilterType'
    import FvFilterService from './VouchersFilterService'
    import FvFilterCategory from './VouchersFilterCategory'
    import LetterFilter from '../LetterFilter/index'
    import FvSort from './VoucherSorting'


    export default {
        name: "fv-vouchers-view",
        components: {FvList, FvFilterType, FvFilterService, FvFilterCategory, FvLetterFilter: LetterFilter, FvSort},
        data() {
            return {
                filterTypes: {},
                type: 'discount,promocode,offer',
                filterServices: [],
                services: '',
                filterCategories: [],
                categories: '',
                vouchers: [],
                startingLetter: '',
                limit: '10',
                sort: ''
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
            limit: function () {
                this.getData()
            },
            sort: function () {
                this.getData()
            }
        },
        mounted() {
            this.getData()
        },
        methods: {
            async getData() {
                const url = `/api/vouchers?voucher_types=${this.type}&services=${this.services}&categories=${this.categories}&limit=${this.limit}&sort=${this.sort}`;
                let response = await this.$http.get(url);
                this.vouchers = response.body.data;
                this.filterServices = response.body.services;
                this.filterCategories = response.body.categories;
                this.filterTypes = response.body.types;
                this.limit = response.body.limit;
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
            onLetterFilter($event) {
                this.startingLetter = $event.letter;
            },
            onSortChange($event) {
                this.sort = $event.sort;
            }
        },
    }
</script>