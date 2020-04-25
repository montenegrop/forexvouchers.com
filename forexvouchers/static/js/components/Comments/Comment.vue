<template>
    <b-row class="infoAndImage" :ref="`comment-${id}`">
        <b-col cols="8" class="text-left">
            <div class="rate-container">
                <rate :length="5" :value="stars" readonly/>
            </div>
            <p>by {{ name }}</p>
            <p class="text-primary">{{text}}</p>
            <a :href="service_url" class="text-primary"> {{ service_name }}</a>


        </b-col>
        <b-col cols="4" class="text-right text-dark">
            <p class="text-with-flag">
                <timeago :datetime="created_at"></timeago>
            </p>
            <span v-if="country_code"
                  :class="['flag flag-icon flag-icon-squared rounded-circle border border-secondary fa-3x', 'flag-icon-' + country_code.toLowerCase()]"></span>
            <i v-else="country_code" class="fas fa-3x fa-globe-americas"></i>
            <div class="text-with-flag"><strong> {{ country_name || 'Unknown' }} </strong></div>
        </b-col>
    </b-row>
</template>

<script>
    import queryString from 'query-string';

    export default {
        name: "fv-comment",
        props: ['id', 'text', 'name', 'country_name', 'country_code', 'stars', 'created_at', 'service_name', 'service_url', 'scroll'],
        mounted() {
            const permalink = Object.keys(queryString.parse(window.location.hash)).pop()

            if (this.scroll && permalink === `comment-${this.id}`) {
                this.$refs[permalink].scrollIntoView()
            }
        }
    };
</script>

