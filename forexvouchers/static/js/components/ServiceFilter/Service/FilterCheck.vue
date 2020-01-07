<template>
    <div>
        <b-form-checkbox
                v-model="status"
                :name="slug"
                :value="slug"
                unchecked-value="not-selected"
        >
        </b-form-checkbox>
    </div>
</template>

<script>
    export default {
        name: "checkbox-for-compare",
        props: ["slug"],
        data() {
            return {
                counter: 0,
                status: 'not-selected',
            }
        },
        watch: {
            status: function () {
                this.$emit('serviceSelected', {ser_slug: this.slug})
            },
        },
    }
</script>