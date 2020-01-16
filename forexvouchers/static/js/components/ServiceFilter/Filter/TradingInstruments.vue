<template>
    <fv-filter-decorator v-if="brokerness" title="Trading Instruments">
        <div>
            <b-row>
                <b-col cols="9">

                    <b-form-group>
                        <b-form-checkbox-group
                                id="checkbox-group-trading-instruments"
                                class="filter-content option-filter"
                                :value="selected"
                                v-on:input="onChange($event)"
                                :options="options.map(option=> ({text: option.name, value: option.id}))"
                                name="flavour-1"
                                stacked
                        />
                    </b-form-group>
                </b-col>

                <b-col cols="3">
                    <b-form-group>
                        <b-form-checkbox-group id="checkbox-group-trading-instruments-numbers"
                                               class="counter-filter d-none d-md-block"
                                               :value="selected"
                                               v-on:input="onChange($event)"
                                               :options="options.map(option=> ({text: '(' + option.total + ')', value: option.id}))"
                                               name="flavour-2"
                                               stacked
                        />
                    </b-form-group>
                </b-col>

            </b-row>
        </div>
    </fv-filter-decorator>
</template>

<script>

    import FvFilterDecorator from '../../FilterDecorator/index'

    export default {
        props: ["brokerness", "options", "onChange"],
        components: {FvFilterDecorator},
    }
</script>