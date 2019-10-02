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
        <ul class="comment-list">
            <li v-for="comment in comments" class="margin-comment" :key="comment.id">
                <fv-comment :text="comment.review"
                            :name="comment.name"
                            :stars="comment.stars"
                            :country_code="comment.country_code"
                            :country_name="comment.country"
                            :created_at="comment.created_at"/>
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

</template>

