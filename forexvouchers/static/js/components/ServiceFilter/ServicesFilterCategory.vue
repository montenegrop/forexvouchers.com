<template>
    <fv-filter-decorator title="Services">
        <div>
            <b-row>
                <b-col cols="9">
                    <b-form-group>
                        <b-form-checkbox-group
                                id="checkbox-group-category-names"
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
                        <b-form-checkbox-group id="checkbox-group-category-numbers"
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

    import FvFilterDecorator from '../FilterDecorator'


    export default {
        props: ["options", "onChange"],
        components: {FvFilterDecorator},
    }
</script>