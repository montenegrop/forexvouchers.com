<template>
    <div v-if="!brokerness">
        <h2 class="filter-titles filter-titles-main mb-0 text-secondary">Forex Services:</h2>

        <b-input-group size="sm" class="mb-4">
            <i class="fas fa-search filter-search-icon"></i>
            <b-form-input class="filter-search-bar" placeholder="Search"
                          v-model="searchBar" v-on:keyup="searchBarChange(searchBar)"></b-form-input>
        </b-input-group>

        <fv-filter-decorator title="Services">
            <div>
                <b-row>
                    <b-col cols="9">

                        <b-form-group>
                            <b-form-checkbox-group
                                    id="checkbox-group-category-names"
                                    class="filter-content option-filter"
                                    v-on:input="onChange($event)"
                                    :options="getNames"
                                    name="flavour-1"
                                    stacked
                            />
                        </b-form-group>
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
        </fv-filter-decorator>
    </div>
</template>

<script>

    import FvFilterDecorator from '../../FilterDecorator/index'


    export default {
        props: ["brokerness", "options", "onChange", "searchBarChange"],
        components: {FvFilterDecorator},

        data() {
            return {
                searchBar: '',
                limit: 15,
            }
        },
        computed: {
            getNames() {
                return this.options
                    .map(option => ({
                        text: option.short_name,
                        total: option.total,
                        value: option.id
                    }))
            },
        },
    }
</script>