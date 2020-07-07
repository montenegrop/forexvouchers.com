<template>
    <b-button v-if="!bottom" variant="light" class="bottom-scroll-button w-100 p-0 m-0 position-sticky" @click="onScrollDown">
        <i class="fa fa-caret-down" aria-hidden="true"></i>
    </b-button>
</template>

<script>
    export default {
        props: ['container'],
        data() {
            return {
                bottom: false
            }
        },
        created() {
            this.$root.$on('fv-scroll-up', event => {
                if (event.container === this.container) {
                    this.bottom = false
                }
            })
        },
        mounted() {
            const container = this.getContainer();
            if (container.scrollHeight <= container.clientHeight) {
                this.bottom = true
            }
        },
        methods: {
            getContainer() {
                if (this.$parent.$refs[this.container]) {
                    return this.$parent.$refs[this.container]
                }
            },
            onScrollDown() {
                const container = this.getContainer();
                container.scrollTop += 100;

                if (container.scrollHeight - container.scrollTop === container.clientHeight) {
                    this.bottom = true
                }
                this.$root.$emit("fv-scroll-down", {container: this.container})
            },
        }
    }
</script>