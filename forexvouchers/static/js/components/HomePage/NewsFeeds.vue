<template>
    <div>
        <b-list-group ref="newsContainer" class="news-list fixed-height position-relative">

            <fv-scroller-up container="newsContainer"></fv-scroller-up>

            <b-list-group-item class="p-0 light-hover" v-for="entry in parseNews">
                <fv-news :entry="entry"></fv-news>
            </b-list-group-item>

            <fv-scroller-down container="newsContainer"></fv-scroller-down>

        </b-list-group>
    </div>
</template>

<script>

    import News from "../Cards/News";
    import ScrollerDown from "../ScrollerDown";
    import ScrollerUp from "../ScrollerUp"

    export default {
        name: "fv-news-feeds",
        components: {FvNews: News, FvScrollerDown: ScrollerDown, FvScrollerUp: ScrollerUp},
        props: ["news"],

        computed: {
            parseNews: function () {
                return this.news.map(x => JSON.parse(x))
            }
        }

    }
</script>