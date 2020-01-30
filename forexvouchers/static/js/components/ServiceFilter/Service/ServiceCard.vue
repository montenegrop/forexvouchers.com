<template>
    <div class="product">
        <div class="row">
            <div class="col-3 col mt-4 d-flex justify-content-center">

                <fv-check :status="status(service)" :slug="service.slug"
                          v-on:serviceSelected="checkForCompare($event)">
                </fv-check>

                <fv-button-compare class="compare-button"
                                   v-if="toCompare.length === 2 && toCompare[1].slug === service.slug"
                                   :services="toCompare"></fv-button-compare>
            </div>

            <div class="col-6 col-md-5 col">
                <div>
                    <img class="logo-img" :src="service.logo_url"/>
                    <div class="title">
                        <a :href="`/forex-brokers/${service.slug}`"> {{ service.name }}</a>
                    </div>
                    <div v-if="service.avg_rate"
                         class="rate-container product-stars">
                        <rate :length="5" :value="service.avg_rate" readonly/>
                    </div>
                    <div v-if="service.avg_rate" class="reviews-count">{{ service.count_rate }} reviews</div>
                    <div>
                        <a class="btn btn-info btn-lg my-3" :href="`/forex-brokers/${service.slug}`">Details</a>
                    </div>
                </div>
            </div>

            <div class="col-3 col-md-4 col d-flex justify-content-center">
                <div>
                    <div class="voucher-count"
                         v-bind:class="{ 'voucher-count-lg': $mq != 'md', 'voucher-count-md': $mq === 'md'}">
                        0
                    </div>
                    <p class="center pr-0">Vouchers</p>
                </div>
            </div>
        </div>
    </div>
</template>

<script>

    import FvCheck from './FilterCheck'
    import FvButtonCompare from './ButtonCompare'

    export default {
        props: ["toCompare", "service", "selected"],
        components: {FvCheck, FvButtonCompare},

        methods: {
            checkForCompare($event) {
                this.$emit('serviceSelected', {ser_slug: $event.ser_slug})
            },
            status(service) {
                return this.selected.includes(service.slug) ? service.slug : 'not-selected';
            },
        }
    }
</script>