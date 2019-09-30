<template>
    <table class="table">
        <thead>
        <tr>
            <th scope="col">#</th>
            <th scope="col"></th>
            <th scope="col">Last</th>
            <th scope="col">Handle</th>
        </tr>
        </thead>
        <tbody>
            <tr>
                <th scope="row">1</th>
                <td>Mark</td>
                <td>Otto</td>
                <td>@mdo</td>
            </tr>
        </tbody>
    </table>
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

