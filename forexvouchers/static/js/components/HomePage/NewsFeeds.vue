<template>

    <b-list-group class="news-list fixed-height">
        <b-list-group-item class="p-0 light-hover" v-for="entry in parseNews">

            <fv-news :entry="entry"></fv-news>

        </b-list-group-item>
    </b-list-group>

</template>


<script>

    import News from "../Cards/News";

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