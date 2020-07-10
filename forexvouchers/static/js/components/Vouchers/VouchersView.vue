<template>
    <div>
        <b-row>
            <b-col cols="9">
                <h2 class="filter-titles filter-titles-main">Search for Discounts, Offers and PromoCodes:</h2>
            </b-col>
            <b-col cols="3">
                <div v-if="$mq === 'sm'" class="show-more">
                    <b-button size="sm" variant="outline-info" href="#"
                              @click.stop.prevent="visible=!visible">
                        {{ showOrHideFilters }}
                    </b-button>
                </div>
            </b-col>
        </b-row>
        <b-row>
            <b-col md="3" class="vouchers-menu vouchers-menu-margin-top">
                <b-collapse id="collapse-4" v-model="visible" class="mt-2">
                    <fv-filter-service :options="filterServices" :onChange="onServiceChange"></fv-filter-service>
                    <fv-filter-type :options="filterTypes" :onChange="onTypeChange"></fv-filter-type>
                    <fv-filter-category :options="filterCategories" :onChange="onCategoryChange"></fv-filter-category>
                </b-collapse>
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
                        <b-button variant="outline-info" :disabled="onLimit" href="#" @click.stop.prevent="getLimit">
                            show more
                        </b-button>
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
                visible: true,
                filterTypes: {},
                type: 'discount,promocode,offer',
                filterServices: [],
                services: '',
                filterCategories: [],
                categories: '',
                vouchers: [],
                startingLetter: '',

                limit: 10,
                limitIncrease: 10,
                vouchersCount: 0,
                onLimit: false,


                sort: '',
            }
        },
        watch: {
            $mq: function () {
                this.smallBreakpoint();
            },
            type: function () {
                this.getData();
            },
            services: function () {
                this.getData();
            },
            categories: function () {
                this.getData();
            },
            sort: function () {
                this.getData()
            }
        },
        mounted() {
            this.getData()
        },
        methods: {
            smallBreakpoint: function () {
                this.visible = this.$mq != 'sm'
            },
            async getData() {
                const url = `/api/vouchers?voucher_types=${
                    this.type}&services=${
                    this.services}&categories=${
                    this.categories}&limit=${
                    this.limit}&sort=${
                    this.sort}`;
                let response = await this.$http.get(url);
                this.vouchers = response.body.data;
                this.filterServices = response.body.services;
                this.filterCategories = response.body.categories;
                this.filterTypes = response.body.types;
                if (this.vouchersCount + this.limitIncrease > this.vouchers.length) {
                    this.onLimit = true
                }
            },

            getLimit() {
                this.vouchersCount = this.vouchers.length;
                this.limit += this.limitIncrease;
                this.getData()
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
        computed: {
            showOrHideFilters: function () {
                return this.visible ? 'hide filters' : 'show filters'
            }
        }
    }
</script>