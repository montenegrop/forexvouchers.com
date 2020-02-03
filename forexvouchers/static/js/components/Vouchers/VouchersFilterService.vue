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
                    <b-form-checkbox-group class="filter-content option-filter"
                                           value="selected"
                                           v-on:input="onChange($event)"
                                           :options="getNames"
                                           stacked
                    ></b-form-checkbox-group>
                </b-form-group>
                <div class="show more show-more-services" v-if="options.length > limit">
                    <a href="#" @click.stop.prevent="limit += 10">more services</a>
                </div>

            </b-col>

            <b-col cols="3" class="m-0 p-0 checkbox-amount">
                <b-list-group>
                    <b-list-group-item v-for="option in getNames" class="p-0 m-0 border-0 list-group-item"><p
                            class="mt-0 mb-0"> ({{option.total}})</p>
                    </b-list-group-item>
                </b-list-group>
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
                limit: 15,
            }
        },


        computed: {
            getNames() {
                console.log(this.options)
                return this.options
                    .map(option => ({
                        text: option.name,
                        total: option.total,
                        value: option.id
                    }))
                    .filter((option, index) => (index < this.limit) && option.text.match(new RegExp(this.search, "i")))
            },
        },

    }
</script>

