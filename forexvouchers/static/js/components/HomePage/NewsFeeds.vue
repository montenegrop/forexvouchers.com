<template>

    <b-list-group>
        <b-list-group-item v-for="entry in parseNews">

            <fv-new :entry="entry"></fv-new>

        </b-list-group-item>
    </b-list-group>

</template>


<script>

    import New from "../Cards/Broker/New";

    const cache = {};
    export default {
        name: "fv-news-feeds",
        components: {FvNew: New},
        props: ["news"],


        computed: {
            parseNews: function () {
                return this.news.map(x => JSON.parse(x))
            }
        }

    }
</script>