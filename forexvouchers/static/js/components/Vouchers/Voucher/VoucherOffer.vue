<template>

    <b-container class="product">

        <b-row class="voucher-discount-row">

            <b-col cols="3" align-self="center">

                <img :src="voucher.logo" class="product-image">
            </b-col>

            <b-col cols="5" align-self="center" class="product-info-discount">

                <p> {{ voucher.name }} </p>
            </b-col>

            <b-col cols="1" align-self="center">

                <div></div>
            </b-col>

            <b-col cols="3" align-self="center">

                <div class="product-link-discount">

                    <a :href="voucher.affiliate.url">

                        <button type="button" class="btn btn-info btn-lg product-link-button">

                            View Offer
                        </button>
                    </a>
                </div>
            </b-col>
        </b-row>

        <b-row class="voucher-info">
            <b-col class="col-auto product-service voucher-info-service">

                By
                <a class="product-service-link"
                   :href="voucher.service_affiliate.url">
                    {{voucher.service_name }} </a>
            </b-col>

            <b-col class="col-auto product-stars rate-container flexible voucher-info-service">

                <rate :length="5" :value="3" readonly/>
            </b-col>

            <b-col class="product-expires voucher-info-service-expiration-never" v-if="voucher.never_expires">

                Never Expires
            </b-col>

            <b-col class="product-expires voucher-info-service-expiration" v-else>

                Expires
                <timeago :datetime="voucher.expires"></timeago>
            </b-col>

        </b-row>
    </b-container>

</template>


<script>

    export default {
        name: "fv-vouchers-offer",
        props: ['voucher'],
        data() {
            return {}
        }
    }

</script>