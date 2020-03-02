<template>
    <div class="container partner-card text-center">
        <div class="text-center mt-1">
            <a class="mb-0 text-primary mt-1" :href="`${entry.link}`" target="_blank"><h6 class="text-left no-shadow mb-1">{{ entry.title }}</h6></a>
            <p class="text-left mb-1">Read more on <a class="text-primary" target="_blank" :href="entry.source.url_site">{{
                entry.source.url_site }}</a></p>
        </div>
    </div>
</template>


<script>
    export default {
        props: ["entry"],
    }
</script>