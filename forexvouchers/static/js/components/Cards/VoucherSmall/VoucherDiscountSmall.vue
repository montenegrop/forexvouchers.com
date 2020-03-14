<template>
    <div v-bind:class="[{ 'product': !isFlex } , { 'product-card': isFlex }]">
        <div class="product-image-wrapper">
            <img :src="voucher.logo" class="product-image">
        </div>

        <div class="product-discount">{{ voucher.discount_percent }}% OFF</div>

        <div class="product-info">
            <a :href="voucher.middleware_url">
                <h5 :title="voucher.name"> {{ voucher.name }} </h5>
            </a>
        </div>

        <div class="container text-center">

            <div class="voucher-name"> By
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
            <div v-if="showClicks" class="product-clicks">
                {{ voucher.affiliate.clicks_large }} clicks
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
        props: ['voucher', 'showClicks', 'isFlex'],
    }

</script>