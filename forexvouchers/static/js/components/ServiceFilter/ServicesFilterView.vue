<template>
    <div>
        <h2 v-show="!isBrokerPage" class="filter-titles filter-titles-main">Forex Services:</h2>
        <h2 v-show="isBrokerPage" class="filter-titles filter-titles-main">Forex Brokers:</h2>
        <b-row>
            <b-col md="3" class="vouchers-menu vouchers-menu-margin-top">

                <!--services-->
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


                <!--brokers-->
                <fv-filter-regulation :brokerness="isBrokerPage" :options="filterRegulations"
                                      :onChange="onRegulationChange"></fv-filter-regulation>

                <fv-filter-broker-type :brokerness="isBrokerPage" :options="filterBrokerTypes"
                                       :onChange="onBrokerTypeChange"></fv-filter-broker-type>


                <fv-filter-min-lot-size :brokerness="isBrokerPage" :minimum="minLotSize"
                                        :onChange="onMinLotSizeChange"></fv-filter-min-lot-size>

                <fv-filter-deposit :brokerness="isBrokerPage" :minDeposit="minDeposit" :maxDeposit="maxDeposit"
                                   :onChange="onDepositChange"></fv-filter-deposit>

                <fv-filter-spread :brokerness="isBrokerPage" :minimum="spread"
                                        :onChange="onSpreadChange"></fv-filter-spread>

                <fv-filter-commission :brokerness="isBrokerPage" :minimum="commission"
                                        :onChange="onCommissionChange"></fv-filter-commission>
                <fv-filter-leverage :brokerness="isBrokerPage" :minLeverage="minLeverage" :maxLeverage="maxLeverage"
                                   :onChange="onLeverageChange"></fv-filter-leverage>


                <fv-filter-trading-instrument :brokerness="isBrokerPage" :options="filterTradingInstruments"
                                              :onChange="onTradingInstrumentChange"></fv-filter-trading-instrument>

                <fv-filter-deposit-method :brokerness="isBrokerPage" :options="filterDepositMethods"
                                          :onChange="onDepositMethodChange"></fv-filter-deposit-method>

                <fv-filter-withdraw-method :brokerness="isBrokerPage" :options="filterWithdrawMethods"
                                           :onChange="onWithdrawMethodChange"></fv-filter-withdraw-method>

                <fv-filter-operating-system :brokerness="isBrokerPage" :options="filterOperatingSystems"
                                            :onChange="onOperatingSystemChange"></fv-filter-operating-system>

            </b-col>
            <b-col md="9">
                <div class="separator">
                    <FvLetterFilter :options="services.map(service => ({text: service.name}))"
                                    v-on:clickLetter="onLetterFilter($event)"
                                    :selected="startingLetter"></FvLetterFilter>
                    <fv-sort v-on:sortedBy="onSortChange($event)"></fv-sort>
                </div>

                <div>
                    <fv-services v-if="!isBrokerPage" :services="services" :selected="selected"
                                 v-on:serviceSelected="checkForCompare($event)"></fv-services>

                    <fv-brokers v-else :services="services" :selected="selected"
                                v-on:serviceSelected="checkForCompare($event)"></fv-brokers>

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
    import FvFilterSystemType from './ServicesFilterSystemType'
    import FvFilterTradingTool from './ServicesFilterTradingTool'
    import FvFilterPricingModel from './ServicesFilterPricingModel'

    import FvServices from './Service/Services'
    import FvBrokers from './Service/Brokers'
    import LetterFilter from '../LetterFilter/index'
    import FvSort from './ServicesFilterSorting'

    import FvFilterRegulation from './ServicesFilterRegulation'
    import FvFilterBrokerType from './ServicesFilterBrokerType'
    import FvFilterTradingInstrument from './ServicesFilterTradingInstruments'
    import FvFilterDepositMethod from './ServicesFilterDepositMethod'
    import FvFilterWithdrawMethod from './ServiceFilterWithdrawMethod'
    import FvFilterOperatingSystem from './ServicesFilterOperatingSystem'
    import FvFilterTradingSoftware from './ServicesFilterTradingSoftware'
    import FvFilterMinLotSize from './ServicesFilterMinLotSize'
    import FvFilterDeposit from './ServicesFilterDeposit'
    import FvFilterSpread from './ServicesFilterSpread'
    import FvFilterCommission from './ServicesFilterComission'
    import FvFilterLeverage from './ServicesFilterLeverage'


    export default {
        name: "fv-services-filter-view",
        components: {
            FvFilterCategory,
            FvFilterTradingType,
            FvFilterTradingSoftware,
            FvFilterSystemType,
            FvFilterTradingTool,
            FvFilterPricingModel,
            FvServices,
            FvBrokers,
            FvLetterFilter: LetterFilter,
            FvSort,
            FvFilterRegulation,
            FvFilterBrokerType,
            FvFilterTradingInstrument,
            FvFilterDepositMethod,
            FvFilterWithdrawMethod,
            FvFilterOperatingSystem,
            FvFilterMinLotSize,
            FvFilterDeposit,
            FvFilterSpread,
            FvFilterCommission,
            FvFilterLeverage,
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
                spread: '',
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
                        this.isBrokerPage}&regulations=${
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
                this.broker_type = value.join(',')
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