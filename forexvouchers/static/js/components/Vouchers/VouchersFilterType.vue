<template>
    <div>
        <h5 class="filter-titles">Type</h5>

        <b-row>
            <b-col cols="9">
                <b-form-group>
                    <b-form-checkbox-group
                            id="checkbox-types-vouchers"
                            class="filter-content option-filter"
                            :value="selected"
                            v-on:input="onChange($event)"
                            :options="types"
                            name="flavour-1"
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


    </div>
</template>

<script>
    export default {
        props: ["options", "onChange"],

        data() {
            return {
                types: [
                    {text: 'Discounts', value: 'discount'},
                    {text: 'PromoCodes', value: 'promocode'},
                    {text: 'Offers', value: 'offer'}
                ],
            }
        },
    }
</script>