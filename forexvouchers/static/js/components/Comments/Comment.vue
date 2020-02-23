<template>
    <b-row class="infoAndImage">
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
                  :class="['flag flag-icon flag-icon-squared rounded-circle border border-secondary fa-4x', 'flag-icon-' + country_code.toLowerCase()]"></span>
            <i v-else="country_code" class="fas fa-4x fa-globe-americas"></i>
            <div class="text-with-flag"><strong> {{ country_name || 'Unknown' }} </strong></div>
        </b-col>
    </b-row>
</template>

<script>

    export default {
        name: "fv-comment",
        props: ['text', 'name', 'country_name', 'country_code', 'stars', 'created_at', 'service_name', 'service_url'],
        data() {
            return {}
        }
    };
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
    h3 {
        margin: 40px 0 0;
    }

    ul {
        list-style-type: none;
        padding: 0;
    }

    li {
        display: inline-block;
        margin: 0 10px;
    }

    a {
        color: #42b983;
    }
</style>
