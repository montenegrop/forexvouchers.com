<template>

    <div v-if="show">
        <b-button :href="'/fb/compare/' +  comparing[0]  + '-vs-' +  comparing[1] "
                  :disabled="comparing.length < 2" size="lg" variant="primary">{{ comparing[0] }} vs
            {{
            comparing[1] }}
        </b-button>
    </div>

</template>

<script>
    export default {
        props: ['show', 'comparing'],
        data() {
        },
        methods: {},
    }
</script>