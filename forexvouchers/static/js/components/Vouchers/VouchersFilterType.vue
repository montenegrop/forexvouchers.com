<template>
    <div>
        <fv-filter-decorator title="Type">

            <b-row>
                <b-col cols="9">
                    <b-form-group>
                        <b-form-checkbox-group
                                id="checkbox-types-vouchers"
                                class="filter-content option-filter"
                                :value="selected"
                                v-on:input="onChangeLocal($event)"
                                :options="types"
                                name="flavour-1"
                                :checked="selectedValues"
                                stacked
                        ></b-form-checkbox-group>
                    </b-form-group>
                </b-col>

                <b-col cols="3" class="m-0 p-0 checkbox-amount">
                    <b-list-group>
                        <b-list-group-item class="p-0 m-0 border-0 list-group-item"><p
                                class="mt-0 mb-0"> ({{options.discount}})</p>
                        </b-list-group-item>

                        <b-list-group-item class="p-0 m-0 border-0 list-group-item"><p
                                class="mt-0 mb-0"> ({{options.promocode}})</p>
                        </b-list-group-item>

                        <b-list-group-item class="p-0 m-0 border-0 list-group-item"><p
                                class="mt-0 mb-0"> ({{options.offer}})</p>
                        </b-list-group-item>
                    </b-list-group>
                </b-col>
            </b-row>
        </fv-filter-decorator>
    </div>
</template>

<script>
    import queryString from 'query-string'
    import FvFilterDecorator from '../FilterDecorator/index'


    export default {
        props: ["options", "onChange", "selected"],
        components: {FvFilterDecorator},

        data() {
            const urlParams = queryString.parse(location.search)

            return {
                isUrlFilterEmpty: !urlParams.type,
                types: [
                    {text: 'Discounts', value: 'discount'},
                    {text: 'PromoCodes', value: 'promocode'},
                    {text: 'Offers', value: 'offer'}
                ],
            }
        },
        computed: {
            selectedValues() {
                const urlParams = queryString.parse(location.search)

                const selected = this.selected ? this.selected.split(',') : []
                if (this.isUrlFilterEmpty) {
                    return []
                }

                return selected
            }
        },
        methods: {
            onChangeLocal(event) {
                this.isUrlFilterEmpty = false
                this.onChange(event)
            }
        }
    }
</script>