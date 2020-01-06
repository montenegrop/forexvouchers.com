<template>
    <fv-filter-decorator title="Trading Type">
        <div>
            <b-row>
                <b-col cols="9">

                    <b-form-group>
                        <b-form-checkbox-group
                                id="trading-type-filter"
                                class="filter-content option-filter"
                                :value="selected"
                                v-on:input="onChange($event)"
                                :options="options.map(option=> ({text: option.name, value: option.id}))"
                                name="trading-type-filter"
                                stacked
                        ></b-form-checkbox-group>
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