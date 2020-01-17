<template>
    <div>
        <div v-if="!brokerness">
            <b-dropdown id="dropdown-right-services" right :text="title" variant="primary" class="m-2">
                <b-dropdown-item href="#" v-on:click="sortChange('Premium','premium')">Premium</b-dropdown-item>
                <b-dropdown-item href="#" v-on:click="sortChange('Top Rated','toprated')">Top Rated</b-dropdown-item>
            </b-dropdown>
        </div>

        <div v-if="brokerness">
            <b-dropdown id="dropdown-right-brokers" right :text="title" variant="primary" class="m-2">
                <b-dropdown-item href="#" v-on:click="sortChange('Premium','premium')">Premium</b-dropdown-item>
                <b-dropdown-item href="#" v-on:click="sortChange('Most Viewed','mostviewed')">Most Viewed
                </b-dropdown-item>
                <b-dropdown-item href="#" v-on:click="sortChange('Top Rated','toprated')">Top Rated</b-dropdown-item>
                <b-dropdown-item href="#" v-on:click="sortChange('Newest','newest')">Newest</b-dropdown-item>
            </b-dropdown>
        </div>
    </div>
</template>

<script>
    export default {
        name: "fv-sort",
        props: ["brokerness"],
        data() {
            return {
                title: "Sort By",
            }
        },
        methods: {
            sortChange(label, value) {
                this.title = label
                this.$emit('sortedBy', {sort: value})
            }

        }
    }
</script>