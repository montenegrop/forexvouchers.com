<template>
    <div class="container partner-card text-center">
        <div class="text-center mb-2">
            <a class="mb-0 text-primary" :href="`${entry.link}`"> {{ entry.title }}</a>
            <p>{{ entry.description }}</p>

        </div>
    </div>
</template>


<script>
    export default {
        props: ["entry"],
    }
</script>