<template>
    <div class="mb-5">
        <b-row>
            <b-col md="3" class="vouchers-menu vouchers-menu-margin-top">

                <b-row>
                    <b-col cols="9">
                        <h2 v-if="isBrokerPage" class="filter-titles filter-titles-main mb-0 text-secondary ">Forex
                            Brokers:</h2>
                        <h2 v-if="!isBrokerPage" class="filter-titles filter-titles-main mb-0 text-secondary ">Forex
                            Services:</h2>
                    </b-col>
                    <b-col cols="3">
                        <b-link
                                :class="visible ? null : 'collapsed'"
                                :aria-expanded="visible ? 'true' : 'false'"
                                aria-controls="collapse-4"
                                @click="visible = !visible"
                                variant="info"
                        >

                            <div v-if="$mq === 'sm'" class="show-more">
                                <b-button size="sm" variant="outline-info" href="#"
                                          @click.stop.prevent="visible=!visible">
                                    {{ showOrHideFilters }}
                                </b-button>
                            </div>

                        </b-link>
                    </b-col>
                </b-row>
                <b-collapse id="collapse-4" v-model="visible" class="mt-2">

                    <fv-all-filters :isBrokerPage="isBrokerPage"
                                    :filterCategories="filterCategories"
                                    :categories="categories"
                                    :onCategoryChange="onCategoryChange"
                                    :filterTradingTypes="filterTradingTypes"
                                    :onTradingTypeChange="onTradingTypeChange"
                                    :filterTradingSoftwares="filterTradingSoftwares"
                                    :onTradingSoftwareChange="onTradingSoftwareChange"
                                    :filterSystemTypes="filterSystemTypes"
                                    :onSystemTypeChange="onSystemTypeChange"
                                    :filterTradingTools="filterTradingTools"
                                    :onTradingToolChange="onTradingToolChange"
                                    :filterPricingModels="filterPricingModels"
                                    :onPricingModelChange="onPricingModelChange"
                                    :filterRegulations="filterRegulations"
                                    :onRegulationChange="onRegulationChange"
                                    :filterBrokerTypes="filterBrokerTypes"
                                    :onBrokerTypeChange="onBrokerTypeChange"
                                    :onMinLotSizeChange="onMinLotSizeChange"
                                    :onDepositChange="onDepositChange"
                                    :onSpreadChange="onSpreadChange"
                                    :onCommissionChange="onCommissionChange"
                                    :onLeverageChange="onLeverageChange"
                                    :filterTradingInstruments="filterTradingInstruments"
                                    :onTradingInstrumentChange="onTradingInstrumentChange"
                                    :filterDepositMethods="filterDepositMethods"
                                    :onDepositMethodChange="onDepositMethodChange"
                                    :filterWithdrawMethods="filterWithdrawMethods"
                                    :onWithdrawMethodChange="onWithdrawMethodChange"
                                    :filterOperatingSystems="filterOperatingSystems"
                                    :onOperatingSystemChange="onOperatingSystemChange"
                                    :onSearchBarChange="filterServicesByName"></fv-all-filters>

                </b-collapse>
            </b-col>

            <b-col md="9">
                <div class="separator">
                    <FvLetterFilter :options="services.map(service => ({text: service.name}))"
                                    v-on:clickLetter="onLetterFilter($event)"
                                    :selected="startingLetter"></FvLetterFilter>
                    <fv-sort :brokerness="isBrokerPage" v-on:sortedBy="onSortChange($event)"></fv-sort>
                </div>

                <div>
                    <fv-services v-if="!isBrokerPage" :services="services" :selected="selected"
                                 v-on:serviceSelected="checkForCompare($event)"></fv-services>

                    <fv-brokers v-else :services="services" :selected="selected"
                                v-on:serviceSelected="checkForCompare($event)"></fv-brokers>

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


    import FvServices from './Service/Services'
    import FvBrokers from './Service/Brokers'
    import LetterFilter from '../LetterFilter/index'
    import FvSort from './Filter/Sorting'
    import FvAllFilters from './allFilters'

    import _ from 'lodash'
    import queryString from 'query-string'

    export default {
        name: "fv-services-filter-view",
        components: {
            FvServices,
            FvBrokers,
            FvLetterFilter: LetterFilter,
            FvSort,
            FvAllFilters,
        },
        data() {
            const isBrokerPage = document.location.href.indexOf('broker') !== -1;
            const urlParams = queryString.parse(location.search);

            return {
                isBrokerPage,
                services: [],


                // for hiding filters
                visible: Boolean,

                // for forex-services:
                categories: urlParams.categories || '',
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
                // features:
                minLotSize: '',
                minDeposit: '',
                maxDeposit: '',
                spread: -1,
                commission: '',
                minLeverage: '',
                maxLeverage: '',


                tradingInstruments: '',
                filterTradingInstruments: [],
                depositMethods: '',
                filterDepositMethods: [],
                withdrawMethods: '',
                filterWithdrawMethods: [],
                operatingSystems: '',
                filterOperatingSystems: [],

                startingLetter: '',

                limit: 10,
                limitIncrease: 10,
                servicesCount: -this.limitIncrease,
                onLimit: false,

                sort: '',
                typed: '',

                selected: [],
                counter: 0,
            }
        },
        watch: {
            $mq: function () {
                this.smallBreakpoint();
            },

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

            // Brokers:
            regulations: function () {
                this.getData();
            },
            brokerTypes: function () {
                this.getData();
            },
            tradingInstruments: function () {
                this.getData();
            },
            depositMethods: function () {
                this.getData();
            },
            withdrawMethods: function () {
                this.getData();
            },
            operatingSystems: function () {
                this.getData();
            },


            minLotSize: function () {
                this.getData()
            },
            minDeposit: function () {
                this.getData()
            },
            spread: function () {
                this.getData()
            },
            commission: function () {
                this.getData()
            },
            minLeverage: function () {
                this.getData()
            },
            sort: function () {
                this.getData()
            }
        },

        beforeMount() {


            this.smallBreakpoint();
        },

        mounted: function () {
            this.getData();
        },
        computed: {
            showOrHideFilters: function () {
                return this.visible ? 'hide filters' : 'show filters'
            },


        },

        methods: {
            async getData() {
                if (!this.isBrokerPage) {
                    const url = `/api/forex-services?brokerness=${
                        this.isBrokerPage}&typed=${
                        this.typed}&categories=${
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
                } else {
                    const url = `/api/forex-services?brokerness=${
                        this.isBrokerPage}&typed=${
                        this.typed}&trading_softwares=${
                        this.tradingSoftwares}&regulations=${
                        this.regulations}&broker_types=${
                        this.brokerTypes}&trading_instruments=${
                        this.tradingInstruments}&deposit_methods=${
                        this.depositMethods}&withdraw_methods=${
                        this.withdrawMethods}&operating_systems=${
                        this.operatingSystems}&min_lot_size=${
                        this.minLotSize}&min_deposit=${
                        this.minDeposit}&max_deposit=${
                        this.maxDeposit}&limit=${
                        this.limit}&spread=${
                        this.spread}&commission=${
                        this.commission}&min_leverage=${
                        this.minLeverage}&max_leverage=${
                        this.maxLeverage}&sort=${
                        this.sort}`;
                    let response = await this.$http.get(url);
                    this.services = response.body.data;
                    this.filterRegulations = response.body.regulations;
                    this.filterBrokerTypes = response.body.broker_types;
                    this.filterTradingSoftwares = response.body.trading_softwares;
                    this.filterTradingInstruments = response.body.trading_instruments;
                    this.filterDepositMethods = response.body.deposit_methods;
                    this.filterWithdrawMethods = response.body.withdraw_methods;
                    this.filterOperatingSystems = response.body.operating_systems;
                }

                if (this.servicesCount + this.limitIncrease > this.services.length) {
                    this.onLimit = true
                }
            },

            smallBreakpoint: function () {
                this.visible = this.$mq != 'sm'
            },

            getLimit() {
                this.servicesCount = this.services.length;
                this.limit += this.limitIncrease;
                this.getData()
            },
// services
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
// brokers
            onRegulationChange(value) {
                this.regulations = value.join(',')
            },
            onBrokerTypeChange(value) {
                this.brokerTypes = value.join(',')
            },
            onTradingInstrumentChange(value) {
                this.tradingInstruments = value.join(',')
            },
            onDepositMethodChange(value) {
                this.depositMethods = value.join(',')
            },
            onWithdrawMethodChange(value) {
                this.withdrawMethods = value.join(',')
            },
            onOperatingSystemChange(value) {
                this.operatingSystems = value.join(',')
            },


            onMinLotSizeChange(value) {
                this.minLotSize = value
            },
            onDepositChange(value) {
                this.minDeposit = value.from;
                this.maxDeposit = value.to;
            },
            onSpreadChange(value) {
                this.spread = value
            },
            onCommissionChange(value) {
                this.commission = value
            },
            onLeverageChange(value) {
                this.minLeverage = value.from;
                this.maxLeverage = value.to;
            },


            onSortChange($event) {
                this.sort = $event.sort;
            },
            onLetterFilter($event) {
                this.startingLetter = $event.letter;
            },
            checkForCompare($event) {
                const i = this.selected.indexOf($event.ser_slug);
                if (i !== -1) {
                    var arr = this.selected.filter(slug => slug !== $event.ser_slug);
                    this.selected = arr;
                } else {
                    var arr = this.selected;
                    arr.push($event.ser_slug);
                    if (arr.length > 2) {
                        arr = this.selected.filter(slug => arr.indexOf(slug) != 0);
                        this.selected = arr;
                    } else {
                        this.selected = arr;
                    }
                }
            },

            delayed: _.debounce(function (func) {
                func()
            }, 350),
            filterServicesByName(value) {
                this.typed = value;
                this.delayed(this.getData)
            },
        },
    }
</script>