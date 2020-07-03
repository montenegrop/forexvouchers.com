<template>
    <b-button v-if="!top" class="top-scroll-button w-100 p-0 m-0 position-sticky" @click="onScrollUp">
        <i class="fa fa-caret-up" aria-hidden="true"></i>
    </b-button>
</template>

<script>
    export default {
        props: ['container'],
        data() {
            return {
                top: true,
            }
        },
        created() {
            this.$root.$on('fv-scroll-down', event => {
                if (event.container === this.container) {
                    this.top = false
                }
            })
        },
        methods: {
            getContainer() {
                if (this.$parent.$refs[this.container]) {
                    return this.$parent.$refs[this.container]
                }
            },
            onScrollUp() {
                const container = this.getContainer()
                container.scrollTop -= 100;
                if (container.scrollTop === 0) {
                    this.top = true
                }
                this.$root.$emit("fv-scroll-up", {container: this.container})
            },
        },
    }
</script>