<template>
    <fv-filter-decorator v-if="!brokerness" title="Pricing">
        <div>
            <b-row>
                <b-col cols="9">

                    <b-form-group>
                        <b-form-checkbox-group
                                id="checkbox-group-pricing-model"
                                class="filter-content option-filter"
                                :value="selected"
                                v-on:input="onChange($event)"
                                :options="options.map(option=> ({text: option.name, value: option.id}))"
                                name="flavour-1-pricing-model"
                                stacked
                        />
                    </b-form-group>
                </b-col>
            </b-row>
        </div>
    </fv-filter-decorator>
</template>

<script>

    import FvFilterDecorator from '../FilterDecorator'

    export default {
        props: ["brokerness", "options", "onChange"],
        components: {FvFilterDecorator},
    }
</script>