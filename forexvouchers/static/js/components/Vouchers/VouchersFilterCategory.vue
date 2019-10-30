<template>
    <div>
        <b-form-group label="Category Filter">
            <b-form-checkbox-group
                    id="checkbox-group-3"
                    :value="selected"
                    v-on:input="onChange($event)"
                    :options="options.map(option=> ({text: option.name, value: option.id}))"
                    name="flavour-3"
                    stacked
            ></b-form-checkbox-group>
        </b-form-group>
    </div>
</template>

<script>
    export default {
        props: ["options", "onChange"]
    }
</script>