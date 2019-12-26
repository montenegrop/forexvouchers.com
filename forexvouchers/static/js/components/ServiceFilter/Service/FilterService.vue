<template>
    <div class="row">
        <div class="service-summary col-md-6" v-for="service in services">
            <div class="product">
                <div class="row">
                    <div class="col-3 col">
                    </div>
                    <div class="col-6 col">
                        <div>
                            <img class="logo-img" :src="service.logo_url"/>
                            <div class="title">
                                <a :href="`/services/${service.slug}`"> {{ service.name }}</a>
                            </div>
                            <div v-if="service.avg_rate"
                                 class="rate-container product-stars">
                                <rate :length="5" :value="service.avg_rate" readonly/>
                            </div>
                            <div v-if="service.avg_rate" class="reviews-count">{{ service.count_rate }} reviews</div>
                            <div>
                                <a class="btn btn-info btn-lg my-3" :href="`/services/${service.slug}`">Details</a>
                            </div>
                        </div>
                    </div>

                    <div class="col-3 col row justify-content-center">
                        <div>
                            <div class="voucher-count">
                                0
                            </div>
                            Vouchers
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
</template>


<script>
    export default {
        props: ['services'],
    }
</script>

