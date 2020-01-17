<template>
    <div v-if="!show">

        <h5 class="filter-titles">{{ title }}</h5>
        <slot></slot>

    </div>
</template>

<script>

    export default {
        name: "fv-filter-decorator",
        props: ['title', 'show'],
    }

</script>