<template>

    <div>
        <b-button :href="'/fb/compare/' +  comparing[0]  + '-vs-' +  comparing[1] "
                  :disabled="comparing.length < 2" size="md" variant="primary"><p
                class="font-weight-bold text-warning -underline m-0">Compare:</p> {{ comparing[0] }} <p
                class="font-weight-bold text-warning -underline m-0">-vs-</p>
            {{ comparing[1] }}
        </b-button>
    </div>

</template>

<script>
    export default {
        props: ['comparing'],
        data() {
        },
        methods: {},
    }
</script>