<template>
    <div>
        <h2 class="filter-titles filter-titles-main">Search for Services:</h2>
        <b-row>
            <b-col md="3" class="vouchers-menu vouchers-menu-margin-top">
                <fv-filter-category :brokerness="isBrokerPage" :options="filterCategories"
                                    :onChange="onCategoryChange"></fv-filter-category>
                <fv-filter-trading-type :brokerness="isBrokerPage" :options="filterTradingTypes"
                                        :onChange="onTradingTypeChange"></fv-filter-trading-type>
                <fv-filter-trading-software :brokerness="isBrokerPage" :options="filterTradingSoftwares"
                                            :onChange="onTradingSoftwareChange"></fv-filter-trading-software>
                <fv-filter-system-type :brokerness="isBrokerPage" :options="filterSystemTypes"
                                       :onChange="onSystemTypeChange"></fv-filter-system-type>
                <fv-filter-trading-tool :brokerness="isBrokerPage" :options="filterTradingTools"
                                        :onChange="onTradingToolChange"></fv-filter-trading-tool>
                <fv-filter-pricing-model :brokerness="isBrokerPage" :options="filterPricingModels"
                                         :onChange="onPricingModelChange"></fv-filter-pricing-model>


            </b-col>
            <b-col md="9">
                <div class="separator">
                    <FvLetterFilter :options="services.map(service => ({text: service.name}))"
                                    v-on:clickLetter="onLetterFilter($event)"
                                    :selected="startingLetter"></FvLetterFilter>
                    <fv-sort v-on:sortedBy="onSortChange($event)"></fv-sort>
                    <b-button :href="'/fb/compare/' +  selected[0]  + '-vs-' +  selected[1] "
                              :disabled="selected.length < 2" size="lg" variant="primary">{{ selected[0] }} vs {{
                        selected[1] }}
                    </b-button>
                </div>

                <div>
                    <fv-filter-service :services="services" :selected="selected"
                                       v-on:serviceSelected="checkForCompare($event)"></fv-filter-service>
                    <div class="show-more">
                        <a href="#" @click.stop.prevent="limit += 10">show more</a>
                    </div>
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
            const isBrokerPage = document.location.href.indexOf('broker') !== -1;

            return {
                isBrokerPage,
                services: [],

                // for forex-services:
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

                // for brokers:
                regulations: '',
                filterRegulations: [],
                brokerTypes: '',
                filterBrokerTypes: [],
                // features
                tradingInstruments: '',
                filterTradingInstruments: [],
                depositMethods: '',
                filterDepositMethods: [],
                withdrawMethods: '',
                filterWithdrawMethods: [],
                // tradingSoftware: '',
                // filterTradingSoftware: [],
                operatingSystems: '',
                filterOperatingSystems: [],

                startingLetter: '',
                limit: '10',
                sort: '',

                selected: [],
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
                if (!this.isBrokerPage) {
                    const url = `/api/forex-services?categories=${
                        this.categories}&trading_types=${
                        this.tradingTypes}&trading_softwares=${
                        this.tradingSoftwares}&system_types=${
                        this.systemTypes}&trading_tools=${
                        this.tradingTools}&pricings=${
                        this.pricingModels}&limit=${
                        this.limit}&sort=${
                        this.sort}`;
                    let response = await this.$http.get(url);
                    this.services = response.body.data;
                    this.filterCategories = response.body.categories;
                    this.filterTradingTypes = response.body.trading_types;
                    this.filterTradingSoftwares = response.body.trading_softwares;
                    this.filterSystemTypes = response.body.system_types;
                    this.filterTradingTools = response.body.trading_tools;
                    this.filterPricingModels = response.body.pricing_models;
                    this.limit = response.body.limit;
                } else {
                    const url = `/api/forex-services?categories=${
                        this.categories}&trading_types=${
                        this.tradingTypes}&trading_softwares=${
                        this.tradingSoftwares}&system_types=${
                        this.systemTypes}&trading_tools=${
                        this.tradingTools}&pricings=${
                        this.pricingModels}&limit=${
                        this.limit}&sort=${
                        this.sort}`;
                    let response = await this.$http.get(url);
                    this.services = response.body.data;
                }
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
            onSortChange($event) {
                this.sort = $event.sort;
            },
            onLetterFilter($event) {
                this.startingLetter = $event.letter;
            },
            checkForCompare($event) {
               const i = this.selected.indexOf($event.ser_slug)
                if (i !== -1) {
                    this.$delete(this.selected, i)
                } else {
                    this.selected.push($event.ser_slug);
                    if (this.selected.length > 2) {
                        this.selected.shift()
                    }
                }
            },
        },
    }
</script>