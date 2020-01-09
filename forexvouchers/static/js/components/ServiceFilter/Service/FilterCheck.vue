<template>
        <input class="compare-checkbox"
                type="checkbox"
                :name="slug"
                :value="slug"
                :checked="status === slug? 'checked': ''"
                v-on:click="onChange"
        />
</template>

<script>
    export default {
        name: "checkbox-for-compare",
        props: ["status", "slug"],
        data() {
            return {
                count: 0,
                global: 0,
            }
        },
        methods: {
            onChange: function ($event) {
                    this.$emit('serviceSelected', {ser_slug: this.slug});
            },
        },
    }
</script>