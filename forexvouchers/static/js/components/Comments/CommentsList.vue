<template>
    <div>

        <hr/>

        <div>
            <fv-comments-stars-filter
                    v-on:filterChange="filterChange($event)"
                    v-on:onGoToSubmitForm="onGoToSubmitForm($event)"
                    :stars1="stars1" :stars2="stars2" :stars3="stars3" :stars4="stars4"
                    :stars5="stars5" :total="total"/>
        </div>

        <hr/>


        <b-container class="comment-wrapper no-shadow">
            <b-row class="text-dark">
                <b-col cols="10">
                    <h5>Reviews:</h5>
                </b-col>
                <!--b-col cols="2">
                    <i class="fa fa-sort"></i>
                    Sort: <strong>Relevance</strong>
                </b-col-->
                <b-col cols="2" class="border-left button-filter-stars">
                    <b-dropdown variant="link">
                        <template v-slot:button-content>
                            <i class="fas fa-filter"></i>
                            Filter:
                            <strong v-if="stars == -1">All stars</strong>
                            <strong v-else>{{ stars }} stars</strong>
                        </template>
                        <b-dropdown-item @click="filterChange(-1)">All stars</b-dropdown-item>
                        <b-dropdown-item @click="filterChange(1)">1 star</b-dropdown-item>
                        <b-dropdown-item @click="filterChange(2)">2 star</b-dropdown-item>
                        <b-dropdown-item @click="filterChange(3)">3 star</b-dropdown-item>
                        <b-dropdown-item @click="filterChange(4)">4 star</b-dropdown-item>
                        <b-dropdown-item @click="filterChange(5)">5 star</b-dropdown-item>

                    </b-dropdown>


                </b-col>
            </b-row>
            <hr/>
            <ul class="comment-list">
                <template v-for="comment in comments" :key="`parent-${comment.id}`">
                    <li class="margin-comment">
                        <fv-comment
                                :id="comment.id"
                                :text="comment.review"
                                :name="comment.name"
                                :stars="comment.stars"
                                :country_code="comment.country_code"
                                :country_name="comment.country"
                                :created_at="comment.created_at"
                                scroll="true"
                        />
                    </li>
                </template>
                <li v-show="comments.length == 0">
                    No comments to show
                </li>
                <hr/>
                <ul>

                </ul>
            </ul>

            <b-pagination
                    v-model="currentPage"
                    :total-rows="filteredTotal"
                    :per-page="perPage"
            ></b-pagination>
        </b-container>

        <hr/>
        <div class="goto-submit-form">
            <fv-form v-on:post="post($event)" :show-message="showMessage" :recaptcha_site_key="recaptcha_site_key"/>
        </div>
    </div>

</template>


<style scoped>
    .comment-wrapper ul {
        color: #0ca0d6;
        padding-left: 0;
    }
</style>


<script>
    import FvComment from './Comment'
    import FvForm from './CommentsForm'
    import FvCommentsStarsFilter from './CommentsStarsFilter'
    import queryString from 'query-string';

    let cache = {}

    export default {
        name: "fv-comments-list",
        components: {FvComment, FvForm, FvCommentsStarsFilter},
        props: ['service_id', 'recaptcha_site_key'],
        data() {
            return {
                showMessage: false,
                comments: [],
                currentPage: 0,
                total: 0,
                filteredTotal: 0,
                perPage: 10,
                stars: -1, // -1 means all
            }
        },
        watch: {
            currentPage: function () {
                this.getData();
            },
            stars: function () {
                this.getData();
            }

        },
        mounted() {
            this.getData();
        },
        methods: {
            async post(data) {
                cache = {};
                this.showMessage = true;
                await this.$http.post(`/api/comments`, {
                    ...data,
                    service_id: this.service_id
                }, {
                    headers: {
                        'X-CSRFTOKEN': this.$cookies.get('csrftoken')
                    }
                });
                this.getData();
            },
            async getData() {
                if (!this.currentPage) {
                    return
                }
                const permalink = Object.keys(queryString.parse(window.location.hash)).pop()
                const url = `/api/comments?sort_by=&permalink=${permalink || ''}&service_id=${this.service_id}&stars=${this.stars}&page=${this.currentPage - 1}&limit=${this.perPage}`;
                let response;
                if (cache.hasOwnProperty(url)) {

                    response = cache[url];
                } else {
                    response = (await
                        this.$http.get(url)).data;
                    cache[url] = response;
                }

                this.comments = [...response.data];
                this.total = response.total;
                this.filteredTotal = response.filteredTotal;
                this.stars1 = response.stars1;
                this.stars2 = response.stars2;
                this.stars3 = response.stars3;
                this.stars4 = response.stars4;
                this.stars5 = response.stars5;
                this.currentPage = response.page + 1;
                return response
            },
            filterChange(stars) {
                this.stars = stars;
            },
            onGoToSubmitForm() {
                const container = this.$el.querySelector(".goto-submit-form");
                container.scrollIntoView();
            }
        }
    }
    ;
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
