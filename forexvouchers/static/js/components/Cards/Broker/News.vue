<template>
    <div class="container partner-card text-center">
        <div class="text-center mb-2">
            <a class="mb-0 text-primary" :href="`${entry.link}`" target="_blank"> {{ entry.title }}</a>
        </div>
    </div>
</template>


<script>
    export default {
        props: ["entry"],
    }
</script>