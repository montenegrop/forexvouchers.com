<template>
    <div class="discount-filter-1">
        <h5 class="filter-titles">Service</h5>


        <b-input-group size="sm">
            <i class="fas fa-search filter-search-icon"></i>
            <b-form-input class="filter-search-bar" placeholder="Search by service" v-model="search"></b-form-input>
        </b-input-group>

        <b-row class="discount-filter-2">

            <b-col cols="9">

                <b-form-group>
                    <b-form-checkbox-group id="checkbox-group-21"
                                           class="filter-content option-filter"
                                           :value="selected"
                                           v-on:input="onChange($event)"
                                           :options="getOptions1()"
                                           name="flavour-2"
                                           stacked
                    ></b-form-checkbox-group>
                </b-form-group>

            </b-col>

            <b-col cols="3">

                <b-form-group>
                    <b-form-checkbox-group id="checkbox-group-22"
                                           class="counter-filter d-none d-md-block "
                                           :value="selected"
                                           v-on:input="onChange($event)"
                                           :options="getOptions2()"
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
        props: ["options", "onChange"],

        data() {
            return {
                startingLetter: '',
                search: '',
            }
        },

        methods: {
            getOptions1() {
                return this.options
                    .map(option => ({
                        text: option.name,
                        value: option.id
                    }))
                    .filter(option => option.text.match(new RegExp(this.search, "i")))
            },

            getOptions2() {
                return this.options
                    .filter(option => option.name.match(new RegExp(this.search, "i")))
                    .map(option => ({
                        text: '('.concat(option.total).concat(')'),
                        value: option.id
                    }))
            },

        },

    }
</script>

