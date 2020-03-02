<template>

    <b-list-group>
        <b-list-group-item v-for="entry in parseNews">

            <fv-news :entry="entry"></fv-news>

        </b-list-group-item>
    </b-list-group>

</template>


<script>

    import News from "../Cards/Broker/News";

    export default {
        name: "fv-news-feeds",
        components: {FvNews: News},
        props: ["news"],

        computed: {
            parseNews: function () {
                return this.news.map(x => JSON.parse(x))
            }
        }

    }
</script>