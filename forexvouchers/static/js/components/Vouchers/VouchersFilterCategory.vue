<template>
    <div>


        <h5 class="filter-titles">Category Filter</h5>

        <b-row>

            <b-col cols="9">

                <b-form-group>
                    <b-form-checkbox-group
                            id="checkbox-group-3"
                            class="option-filter"
                            :value="selected"
                            v-on:input="onChange($event)"
                            :options="options.map(option=> ({text: option.name, value: option.id}))"
                            name="flavour-3"
                            stacked
                    ></b-form-checkbox-group>
                </b-form-group>

            </b-col>


            <b-col cols="3">

                <b-form-group>
                    <b-form-checkbox-group id="checkbox-group-22"
                                           class="counter-filter d-none d-md-block"
                                           :value="selected"
                                           v-on:input="onChange($event)"
                                           :options="options.map(option=> ({text: '(' + option.total + ')', value: option.id}))"
                                           name="flavour-2"
                                           stacked
                    ></b-form-checkbox-group>
                </b-form-group>

            </b-col>

        </b-row>


    </div>
</template>

<script>
    export default {
        props: ["options", "onChange"]
    }
</script>