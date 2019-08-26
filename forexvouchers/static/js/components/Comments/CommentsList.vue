<template>
    <div>
        <div>
            <fv-form/>
        </div>

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
            <ul>
                <li v-for="comment in comments" class="margin-comment" :key="comment.id">
                    <fv-comment :text="comment.review"
                                :name="comment.name"
                                :stars="comment.stars"
                                :country_code="comment.country_code"
                                :country_name="comment.country"
                                :created_at="comment.created_at"/>
                </li>
                <ul>

                </ul>
            </ul>

            <b-pagination
                    v-model="currentPage"
                    :total-rows="total"
                    :per-page="perPage"
            ></b-pagination>
        </b-container>
    </div>

</template>

<script>
    import FvComment from './Comment'
    import FvForm from './CommentsForm'

    export default {
        name: "fv-comments-list",
        components: {FvComment, FvForm},
        props: ['service_id'],
        data() {
            return {
                comments: [],
                currentPage: 0,
                total: 0,
                perPage: 10
            }
        },
        async mounted() {
            const response = await this.$http.get(`/api/comments?sort_by=&service_id=${this.service_id}&page=${this.currentPage}&limit=${this.perPage}`);
            const {data, total} = response.data;
            this.comments = data;
            this.total = total;
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
