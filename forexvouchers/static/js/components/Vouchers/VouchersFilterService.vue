<template>
    <div>
        <h5 class="product-clicks">Service Filter</h5>

        <b-input-group size="sm" prepend="glass">
            <b-form-input v-model="search" ></b-form-input>
        </b-input-group>

        <b-form-group>
            <b-form-checkbox-group
                    id="checkbox-group-2"
                    :value="selected"
                    v-on:input="onChange($event)"
                    :options="getOptions()"
                    name="flavour-2"
                    stacked
            ></b-form-checkbox-group>
        </b-form-group>
    </div>
</template>

<script>
    export default {
        props: ["options", "onChange"],

        data() {
            return {
                search: '',
            }

        },

        methods: {
            getOptions() {

                return this.options
                    .map(option=> ({text: option.name, value: option.id}))
                    .filter(option=> option.text.match(new RegExp(this.search,"i")))

            }
        }

    }
</script>