<template>

        <div class="product">
            <div class="product-image-wrapper">
                <img :src="voucher.logo" class="product-image">
            </div>


            <div class="product-discount">{{ voucher.discount_percent }}% OFF</div>

            <div class="product-info">
                <h5 :title="voucher.name"> {{ voucher.name }} </h5>
            </div>

            <div class="container">

                <div class="row">

                    <div class="col-7 product-service"> By
                        <a class="product-service-link"
                           :href="voucher.service_url">
                            {{voucher.service_name }} </a>
                    </div>

                    <div class="col-5 product-stars rate-container flexible">
                        <rate :length="5" :value="voucher.service_rate" readonly/>
                    </div>

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
        props: ['voucher'],
        data() {
            return {}
        }
    }

</script>