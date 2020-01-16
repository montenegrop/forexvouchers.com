<template>
    <div>
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

        <fv-filter-trading-instrument :brokerness="isBrokerPage" :options="filterTradingInstruments"
                                      :onChange="onTradingInstrumentChange"></fv-filter-trading-instrument>

        <fv-filter-deposit-method :brokerness="isBrokerPage" :options="filterDepositMethods"
                                  :onChange="onDepositMethodChange"></fv-filter-deposit-method>

        <fv-filter-withdraw-method :brokerness="isBrokerPage" :options="filterWithdrawMethods"
                                   :onChange="onWithdrawMethodChange"></fv-filter-withdraw-method>

        <fv-filter-operating-system :brokerness="isBrokerPage" :options="filterOperatingSystems"
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