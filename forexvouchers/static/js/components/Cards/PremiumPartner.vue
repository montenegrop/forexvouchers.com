<template>
    <div class="container partner-card text-center">
        <div>
            <img class="img-center" v-if="service.logo_url" :src="service.logo_url"/>
        </div>
        <div class="text-center mb-2">
            <a class="mb-0 text-primary" :href="`${service.url}`"> {{ service.name }}</a>
            <div class="text-center compare-stars rate-container pr-0">

                <rate style="min-width: 85px" :length="5" :value="service.avg_rate"
                      readonly/>
            </div>
        </div>
    </div>
</template>


<script>
    export default {
        props: ["service"],
    }
</script>