<template>
    <div>
        <b-button-group>
            <b-button class="filter-starting-letter" v-bind:class="{ 'filter-starting-letter-active': letter == selected }" variant="outline-info" @click="$emit('clickLetter', {letter: letter})" v-for="letter in letters">
                {{letter}}
            </b-button>
        </b-button-group>
    </div>
</template>


<script>
    export default {
        props: ['options', 'selected'],
        data() {
            const letters = {};
            for (const option of this.options) {
                letters[option.text.charAt(0).toLocaleUpperCase()] = true;
            }

            return {letters: Object.keys(letters).sort()}


        },

        watch: {
            options() {
                const letters = {};
                for (const option of this.options) {
                    letters[option.text.charAt(0).toLocaleUpperCase()] = true;
                }

                this.letters = Object.keys(letters).sort()
            }
        }
    }
</script>

