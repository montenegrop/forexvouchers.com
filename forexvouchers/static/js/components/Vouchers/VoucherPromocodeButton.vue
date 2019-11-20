<template>
    <div class="promocodes2">
        <div class="inner-pc">
            <span class="code-pc">{{ code }}</span>
            <a @click="onReveal" href="javascript:void(0)" :class="{'button-code peel-btn':true, revealed:revealed}">{{
                label }}</a>
        </div>
    </div>
</template>

<script>

    export default {
        props: ['label', 'code'],

        data() {
            return {revealed: false}
        },

        methods: {
            onReveal() {
                event.preventDefault()
                this.revealed = true
            }
        }
    }

</script>