<template>
    <fv-filter-decorator title="Trading Software">
        <div>
            <b-row>
                <b-col cols="9">

                    <b-form-group>
                        <b-form-checkbox-group
                                id="checkbox-group-trading-software"
                                class="filter-content option-filter checkbox-names"
                                :value="selected"
                                v-on:input="onChange($event)"
                                :options="options.map(option=> ({text: option.name, value: option.id}))"
                                name="flavour-1"
                                stacked
                        />
                    </b-form-group>
                </b-col>

                <b-col cols="3" class="m-0 p-0 checkbox-amount">
                    <b-list-group>
                        <b-list-group-item v-for="option in options" class="p-0 m-0 border-0 list-group-item"><p
                                class="mt-0 mb-0"> ({{option.total}})</p>
                        </b-list-group-item>
                    </b-list-group>
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