<template>
    <div>


        <fv-filter-decorator title="Category">

            <b-row>

                <b-col cols="9">

                    <b-form-group>
                        <b-form-checkbox-group
                                id="checkbox-group-3"
                                class="filter-content option-filter"
                                :value="selected"
                                v-on:input="onChange($event)"
                                :options="options.map(option=> ({text: option.name, value: option.id}))"
                                name="flavour-1"
                                stacked
                        ></b-form-checkbox-group>
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
        </fv-filter-decorator>

    </div>
</template>

<script>
    import FvFilterDecorator from '../FilterDecorator/index'

    export default {
        props: ["options", "onChange"],
        components: {FvFilterDecorator},

    }
</script>