<template>
    <b-container class="comment-wrapper no-shadow">
        <b-row class="text-dark">
            <b-col cols="8">
                <h5>Reviews:</h5>
            </b-col>
            <b-col cols="2" class="border-left">
                <i class="fa fa-sort"></i>
                Sort: <strong>Relevance</strong>
            </b-col>
            <b-col cols="2" class="border-left border-right">
                <i class="fas fa-filter"></i>
                Filter: <strong>All star</strong>
            </b-col>
        </b-row>
        <hr/>
        <ul class="xxy">
            <li class="margin-comment">
                <fv-comment title="YYY" name="Matias" stars="3" country_code="ar" country_name="Argentina"
                            created_at="2019-08-21T23:20:50.52Z"/>
            </li>
        </ul>
    </b-container>
</template>

<script>
    import FvComment from './Comment'

    export default {
        name: "fv-comments-list",
        components: {FvComment},
        props: [],
        data() {
            return {}
        }
    };
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
    .comment-wrapper ul {
        color: blue;
        padding-left: 0;
    }
</style>
