<template>
    <div>
        <!--services-->
        <fv-filter-category :brokerness="isBrokerPage" :options="filterCategories"
                                                                :categories="categories"
                          :onChange="onCategoryChange" :searchBarChange="onSearchBarChange"></fv-filter-category>
        <fv-filter-trading-type v-if="filterTradingTypes.length" :brokerness="isBrokerPage" :options="filterTradingTypes"
                                :onChange="onTradingTypeChange"></fv-filter-trading-type>

        <!--        trading software-->


        <!--brokers-->
        <fv-filter-regulation v-if="filterRegulations.length" :brokerness="isBrokerPage" :options="filterRegulations"
                              :onChange="onRegulationChange" :searchBarChange="onSearchBarChange"></fv-filter-regulation>

        <fv-filter-broker-type v-if="filterBrokerTypes.length" :brokerness="isBrokerPage" :options="filterBrokerTypes"
                               :onChange="onBrokerTypeChange"></fv-filter-broker-type>

        <fv-filter-min-lot-size :brokerness="isBrokerPage"
                                :onChange="onMinLotSizeChange"></fv-filter-min-lot-size>

        <fv-filter-deposit :brokerness="isBrokerPage"
                           :onChange="onDepositChange"></fv-filter-deposit>

        <fv-filter-spread :brokerness="isBrokerPage"
                          :onChange="onSpreadChange"></fv-filter-spread>

        <fv-filter-commission :brokerness="isBrokerPage"
                              :onChange="onCommissionChange"></fv-filter-commission>
        <fv-filter-leverage :brokerness="isBrokerPage"
                            :onChange="onLeverageChange"></fv-filter-leverage>

        <fv-filter-trading-instrument v-if="filterTradingInstruments.length" :brokerness="isBrokerPage" :options="filterTradingInstruments"
                                      :onChange="onTradingInstrumentChange"></fv-filter-trading-instrument>

        <fv-filter-deposit-method v-if="filterDepositMethods.length" :brokerness="isBrokerPage" :options="filterDepositMethods"
                                  :onChange="onDepositMethodChange"></fv-filter-deposit-method>

        <fv-filter-withdraw-method v-if="filterWithdrawMethods.length" :brokerness="isBrokerPage" :options="filterWithdrawMethods"
                                   :onChange="onWithdrawMethodChange"></fv-filter-withdraw-method>

<!--        this goes here to mantain order required-->
        <fv-filter-trading-software v-if="filterTradingSoftwares.length" :brokerness="isBrokerPage" :options="filterTradingSoftwares"
                                    :onChange="onTradingSoftwareChange"></fv-filter-trading-software>
        <fv-filter-system-type v-if="filterSystemTypes.length" :brokerness="isBrokerPage" :options="filterSystemTypes"
                               :onChange="onSystemTypeChange"></fv-filter-system-type>
        <fv-filter-trading-tool v-if="filterTradingTools.length" :brokerness="isBrokerPage" :options="filterTradingTools"
                                :onChange="onTradingToolChange"></fv-filter-trading-tool>
        <fv-filter-pricing-model v-if="filterPricingModels.length" :brokerness="isBrokerPage" :options="filterPricingModels"
                                 :onChange="onPricingModelChange"></fv-filter-pricing-model>

        <fv-filter-operating-system v-if="filterOperatingSystems.length" :brokerness="isBrokerPage"
                                    :options="filterOperatingSystems"
                                    :onChange="onOperatingSystemChange"></fv-filter-operating-system>
    </div>
</template>

<script>
    import FvFilterRegulation from './Filter/Regulation'
    import FvFilterBrokerType from './Filter/BrokerType'
    import FvFilterTradingInstrument from './Filter/TradingInstruments'
    import FvFilterDepositMethod from './Filter/DepositMethod'
    import FvFilterWithdrawMethod from './Filter/WithdrawMethod'
    import FvFilterOperatingSystem from './Filter/OperatingSystem'
    import FvFilterTradingSoftware from './Filter/TradingSoftware'
    import FvFilterMinLotSize from './Filter/MinLotSize'
    import FvFilterDeposit from './Filter/Deposit'
    import FvFilterSpread from './Filter/Spread'
    import FvFilterCommission from './Filter/Comission'
    import FvFilterLeverage from './Filter/Leverage'
    import FvFilterCategory from "./Filter/Category";
    import FvFilterTradingType from "./Filter/TradingType";
    import FvFilterSystemType from "./Filter/SystemType";
    import FvFilterTradingTool from "./Filter/TradingTool";
    import FvFilterPricingModel from "./Filter/PricingModel";

    export default {
        name: "fv-all-filters",
        props: ["isBrokerPage",
            "filterCategories",
            "onCategoryChange",
            "filterTradingTypes",
            "onTradingTypeChange",
            "filterTradingSoftwares",
            "onTradingSoftwareChange",
            "filterSystemTypes",
            "onSystemTypeChange",
            "filterTradingTools",
            "onTradingToolChange",
            "filterPricingModels",
            "onPricingModelChange",
            "filterRegulations",
            "onRegulationChange",
            "filterBrokerTypes",
            "onBrokerTypeChange",
            "onMinLotSizeChange",
            "onDepositChange",
            "onSpreadChange",
            "onCommissionChange",
            "onLeverageChange",
            "filterTradingInstruments",
            "onTradingInstrumentChange",
            "filterDepositMethods",
            "onDepositMethodChange",
            "filterWithdrawMethods",
            "onWithdrawMethodChange",
            "filterOperatingSystems",
            "onOperatingSystemChange",
            "onSearchBarChange",
            "categories"
        ],
        components: {
            FvFilterCategory,
            FvFilterTradingType,
            FvFilterTradingSoftware,
            FvFilterSystemType,
            FvFilterTradingTool,
            FvFilterPricingModel,
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
    }

</script>