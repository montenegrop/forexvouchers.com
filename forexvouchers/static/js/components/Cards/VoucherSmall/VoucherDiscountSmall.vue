<template>

    <div class="product product-home">
        <div class="product-image-wrapper">
            <img :src="voucher.logo" class="product-image">
        </div>


        <div class="product-discount">{{ voucher.discount_percent }}% OFF</div>

        <div class="product-info">
            <a :href="voucher.middleware_url">
                <h5 :title="voucher.name"> {{ voucher.name }} </h5>
            </a>
        </div>

        <div class="container" v-bind:class=" {'pl-5': voucherPage}">

                <div class="product-service" v-bind:class=" {'pl-0': voucherPage}"> By
                    <a class="product-service-link"
                       :href="voucher.service_url">
                        {{voucher.service_name }} </a>
                </div>

                <div class="product-stars rate-container flexible">
                    <rate :length="5" :value="voucher.service_rate" readonly/>
                </div>


        </div>


        <div class="product-link text-center">
            <a :href="voucher.middleware_url">
                <button type="button" class="btn btn-info btn-lg product-link-button">
                    Get Discount
                </button>
            </a>
            <div class="product-clicks">
                {{ voucher.affiliate.clicks }} clicks
            </div>
            <div class="product-expires">

                <b-col class="product-expires" v-if="voucher.never_expires">

                    Never Expires
                </b-col>

                <b-col class="product-expires" v-else>

                    Expires
                    <timeago :datetime="voucher.expires"></timeago>
                </b-col>
            </div>
        </div>
    </div>
</template>


<script>
    export default {
        name: "fv-vouchers-discount-small",
        props: ['voucher', 'voucherPage'],
        data() {
            return {}
        }
    }

</script>