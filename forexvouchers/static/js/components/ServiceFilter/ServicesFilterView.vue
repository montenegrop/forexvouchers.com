<template>
    <div>
        <h2 class="filter-titles filter-titles-main">Search for Services:</h2>
        <b-row>
            <b-col md="3" class="vouchers-menu vouchers-menu-margin-top">
                <fv-filter-category :options="filterCategories" :onChange="onCategoryChange"></fv-filter-category>
                <fv-filter-trading-type :options="filterTradingTypes"
                                        :onChange="onTradingTypeChange"></fv-filter-trading-type>
                <fv-filter-trading-software :options="filterTradingSoftwares"
                                            :onChange="onTradingSoftwareChange"></fv-filter-trading-software>
                <fv-filter-system-type :options="filterSystemTypes"
                                       :onChange="onSystemTypeChange"></fv-filter-system-type>
                <fv-filter-trading-tool :options="filterTradingTools"
                                        :onChange="onTradingToolChange"></fv-filter-trading-tool>
                <fv-filter-pricing-model :options="filterPricingModels"
                                         :onChange="onPricingModelChange"></fv-filter-pricing-model>
            </b-col>
            <b-col md="9">
                <div class="separator">
                    <div>
                        <FvLetterFilter :options="services.map(service => ({text: service.name}))"
                                        v-on:clickLetter="onLetterFilter($event)" :selected="startingLetter"/>
                    </div>
                    <div>
                        <FvSort v-on:sortedBy="onSortChange($event)"/>
                    </div>
                </div>

                <div>
                    <div>
                        <fv-filter-service :services="services"/>
                    </div>
                    <!--<div class="show-more">-->
                    <!--<a href="#" @click.stop.prevent="limit += 10">show more</a>-->
                    <!--</div>-->
                </div>
            </b-col>
        </b-row>
    </div>
</template>

<script>

    import FvFilterCategory from './ServicesFilterCategory'
    import FvFilterTradingType from './ServicesFilterTradingType'
    import FvFilterTradingSoftware from './ServicesFilterTradingSoftware'
    import FvFilterSystemType from './ServicesFilterSystemType'
    import FvFilterTradingTool from './ServicesFilterTradingTool'
    import FvFilterPricingModel from './ServicesFilterPricingModel'
    import FvFilterService from './Service/FilterService'
    import LetterFilter from '../LetterFilter/index'
    import FvSort from './ServicesFilterSorting'


    export default {
        name: "fv-services-filter-view",
        components: {
            FvFilterCategory,
            FvFilterTradingType,
            FvFilterTradingSoftware,
            FvFilterSystemType,
            FvFilterTradingTool,
            FvFilterPricingModel,
            FvFilterService,
            FvLetterFilter: LetterFilter,
            FvSort,

        },
        data() {
            return {
                services: [],

                categories: '',
                filterCategories: [],
                tradingTypes: '',
                filterTradingTypes: [],
                tradingSoftwares: '',
                filterTradingSoftwares: [],
                systemTypes: '',
                filterSystemTypes: [],
                tradingTools: '',
                filterTradingTools: [],
                pricingModels: '',
                filterPricingModels: [],

                startingLetter: '',
                limit: '10',
                sort: ''
            }
        },
        watch: {
            categories: function () {
                this.getData();
            },
            tradingTypes: function () {
                this.getData();
            },
            tradingSoftwares: function () {
                this.getData();
            },
            systemTypes: function () {
                this.getData();
            },
            tradingTools: function () {
                this.getData();
            },
            pricingModels: function () {
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
            this.getData();
        },
        methods: {
            async getData() {
                const url = `/api/forex-services?categories=${this.categories}&trading_types=${this.tradingTypes}&limit=${this.limit}`;
                let response = await this.$http.get(url);
                this.services = response.body.data;
                this.filterCategories = response.body.categories;
                this.filterTradingTypes = response.body.trading_types;
                this.filterTradingSoftwares = response.body.trading_softwares;
                this.filterSystemTypes = response.body.system_types;
                this.filterTradingTools = response.body.trading_tools;
                this.filterPricingModels = response.body.pricing_models;
                this.limit = response.body.limit;
            },


            onCategoryChange(value) {
                this.categories = value.join(',')
            },
            onTradingTypeChange(value) {
                this.tradingTypes = value.join(',')
            },
            onTradingSoftwareChange(value) {
                this.tradingSoftwares = value.join(',')
            },
            onSystemTypeChange(value) {
                this.systemTypes = value.join(',')
            },
            onTradingToolChange(value) {
                this.tradingTools = value.join(',')
            },
            onPricingModelChange(value) {
                this.pricingModels = value.join(',')
            },


            // onSortChange($event) {
            //     this.sort = $event.sort;
            // }

            onLetterFilter($event) {
                this.startingLetter = $event.letter;
            },

        },
    }
</script>