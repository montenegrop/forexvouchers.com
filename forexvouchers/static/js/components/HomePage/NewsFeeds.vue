<template>
    <div>
        <b-list-group ref="newsContainer" class="news-list fixed-height position-relative">

            <scroller-up container="newsContainer"></scroller-up>

            <b-list-group-item class="p-0 light-hover" v-for="entry in parseNews">
                <fv-news :entry="entry"></fv-news>
            </b-list-group-item>

            <scroller-down container="newsContainer"></scroller-down>

        </b-list-group>
    </div>
</template>

<script>

    import News from "../Cards/News";
    import ScrollerDown from "../ScrollerDown";
    import ScrollerUp from "../ScrollerUp"

    export default {
        name: "fv-news-feeds",
        components: {FvNews: News, ScrollerDown, ScrollerUp},
        props: ["news"],

        computed: {
            parseNews: function () {
                return this.news.map(x => JSON.parse(x))
            }
        }

    }
</script>