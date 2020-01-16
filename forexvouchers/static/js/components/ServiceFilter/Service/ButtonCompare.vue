<template>

    <div>
        <b-button :href="'/fb/compare/' +  services[0].slug  + '-vs-' +  services[1].slug "
                  :disabled="services.length < 2" size="md" variant="primary"><p
                class="font-weight-bold text-warning -underline m-0">Compare:</p> {{ services[0].name }} <p
                class="font-weight-bold text-warning -underline m-0">vs</p>
            {{ services[1].name }}
        </b-button>
    </div>

</template>

<script>
    export default {
        props: ['services'],
        data() {
            return {}
        },
        methods: {},
    }
</script>