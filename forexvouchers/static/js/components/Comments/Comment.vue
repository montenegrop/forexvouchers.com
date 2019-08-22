<template>
    <li class="margin-comment">
        <b-row class="infoAndImage">
            <b-col cols="8" class="text-left">
                <div class="rate-container">
                    <rate :length="5" :value="stars" readonly/>
                </div>
                <p>by {{ name }}</p>
                <p class="text-primary">{{title}}</p>
            </b-col>
            <b-col cols="4" class="text-right text-dark">
                <p class="text-with-flag">
                    <timeago :datetime="created_at"></timeago>
                </p>
                <span :class="['flag flag-icon flag-icon-squared rounded-circle border border-secondary', 'flag-icon-' + country_code]"></span>
                <div class="text-with-flag"><strong> {{ country_name }} </strong></div>
            </b-col>
        </b-row>
    </li>
</template>

<script>

    export default {
        name: "fv-comment",
        props: ['title', 'name', 'country_name', 'country_code', 'stars', 'created_at'],
        data() {
            return {
            }
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
