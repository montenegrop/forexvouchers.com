<template>
    <div v-if="brokerness">

        <b-input-group size="sm" class="mb-4">
            <i class="fas fa-search filter-search-icon"></i>
            <b-form-input class="filter-search-bar" placeholder="Search" v-model="searchBar"
                          v-on:keyup="searchBarChange(searchBar)"></b-form-input>
        </b-input-group>

        <fv-filter-decorator title="Regulation">
            <div>
                <b-row>
                    <b-col cols="9">

                        <b-form-group>
                            <b-form-checkbox-group
                                    id="checkbox-group-regulation"
                                    class="filter-content option-filter"
                                    v-on:input="onChange($event)"
                                    :options="getNames.slice(0, limit)"
                                    name="flavour-1"
                                    stacked
                            />
                        </b-form-group>
                    </b-col>

                    <b-col v-show="brokerness" cols="3" class="m-0 p-0 checkbox-amount">
                        <b-list-group>
                            <b-list-group-item v-for="option in options.slice(0, limit)"
                                               class="p-0 m-0 border-0 list-group-item"><p
                                    class="mt-0 mb-0"> ({{option.total}})</p>
                            </b-list-group-item>
                        </b-list-group>
                    </b-col>
                </b-row>

                <div v-if="limit < options.length">
                    <a class="show-more-button" href="#"
                       @click.stop.prevent="limit += limitIncrease">
                        <u>more choices</u>
                    </a>
                </div>
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
                limit: 5,
                limitIncrease: 5,
            }
        },
        computed: {
            getNames() {
                return this.options
                    .map(option => ({
                        text: option.name,
                        total: option.total,
                        value: option.id
                    }))
            },
        },

    }
</script>