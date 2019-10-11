<template>
    <div>
        <b-form-group label="Using options array:">
            <b-form-checkbox-group
                    id="checkbox-group-1"
                    :value="selected"
                    v-on:input="onChange($event)"
                    :options="options"
                    name="flavour-1"
            ></b-form-checkbox-group>
        </b-form-group>


        <div>Selected: <strong>{{ selected }}</strong ></div>
    </div>
</template>

<script>
    export default {
        props: ["selected","onChange"],

        data() {
            return {
                options: [
                    {text: 'Discounts', value: 'discount'},
                    {text: 'PromoCodes', value: 'promocode'},
                    {text: 'Offers', value: 'offer'},
                ]
            }
        },

    }
</script>