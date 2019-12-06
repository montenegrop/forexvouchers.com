<template>
    <div>
        <b-dropdown id="dropdown-right" right :text="title" variant="primary" class="m-2">
            <b-dropdown-item href="#" v-on:click="sortChange('Premium','premium')">Premium</b-dropdown-item>
            <b-dropdown-item href="#" v-on:click="sortChange('Most Viewed','topviewed')">Most Viewed</b-dropdown-item>
            <b-dropdown-item href="#" v-on:click="sortChange('Top Rated','toprated')">Top Rated</b-dropdown-item>
            <b-dropdown-item href="#" v-on:click="sortChange('Newest','newest')">Newest</b-dropdown-item>
        </b-dropdown>
    </div>
</template>

<script>
    export default {
        name: "fv-vouchers-sort",
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