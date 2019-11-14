<template>
    <div>
        <h5 class="filter-titles">Type Filter</h5>

        <b-row>
            <b-col cols="9">
                <b-form-group>
                    <b-form-checkbox-group
                            id="checkbox-group-1"
                            :value="selected"
                            v-on:input="onChange($event)"
                            :options="types"
                            name="flavour-1"
                            stacked
                    ></b-form-checkbox-group>
                </b-form-group>
            </b-col>

            <b-col cols="3">
                <b-form-group>
                    <b-form-checkbox-group id="checkbox-group-2"
                                           class="counter-filter d-none d-md-block"
                                           :value="selected"
                                           v-on:input="onChange($event)"
                                           :options="[{text: '('.concat(tipos.discount).concat(')'), value: 1}
                                           , {text: '('.concat(tipos.promocode).concat(')'), value: 2}
                                           , {text: '('.concat(tipos.offer).concat(')'), value: 3}]"
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
        props: ["tipos", "onChange"],

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