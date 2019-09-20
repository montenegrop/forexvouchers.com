<template>
    <div>
        <li v-for="letter in letters">{{letter}}</li>
    </div>
</template>


<script>
    export default {
        props: ['options'],
        data() {
            const letters = {};
            for (const option of this.options) {
                letters[option.text.charAt(0).toLocaleUpperCase()] = true;
            }

            return {letters: Object.keys(letters).sort()}


        }
    }
</script>

