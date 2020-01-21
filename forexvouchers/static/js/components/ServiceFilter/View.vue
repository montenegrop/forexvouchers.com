<template>
    <div>
        <b-row>
            <b-col md="3" class="vouchers-menu vouchers-menu-margin-top">

                <fv-all-filters :isBrokerPage="isBrokerPage"
                                :filterCategories="filterCategories"
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
                                :onOperatingSystemChange="onOperatingSystemChange"></fv-all-filters>

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
                        <a href="#" @click.stop.prevent="changeLimit">show more</a>
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
                limit: '10',
                sort: '',

                selected: [],
                counter: 0,
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
        mounted() {
            this.getData();
        },
        methods: {
            async getData() {
                if (!this.isBrokerPage) {
                    const url = `/api/forex-services?brokerness=${
                        this.isBrokerPage}&categories=${
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
                    const url = `/api/forex-services?brokerness=${
                        this.isBrokerPage}&trading_softwares=${
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
                    this.limit = response.body.limit;
                }
            },

            changeLimit() {
                this.limit += 10;
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
                this.brokerType = value.join(',')
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
        },
    }
</script>