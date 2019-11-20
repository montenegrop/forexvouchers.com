<template>

    <b-container class="product voucher-discount">

        <b-row class="voucher-discount-row">

            <b-col cols="3" align-self="center">

                <img :src="voucher.logo" class="product-image">
            </b-col>

            <b-col cols="5" align-self="center" class="product-info-discount">

                <p> {{ voucher.name }} </p>
                <div class="vouchers-description" v-html="voucher.description"/>

            </b-col>

            <b-col cols="1" align-self="center">

                <div class="discount-discount">{{ voucher.discount_percent }}% OFF</div>
            </b-col>

            <b-col cols="3" align-self="center">

                <div class="product-link-discount">

                    <a :href="voucher.affiliate.url">

                        <button type="button" class="btn btn-info btn-lg product-link-button">

                            Get Discount
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

                <rate :length="5" :value="voucher.service_rate" readonly/>

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
        name: "fv-vouchers-discount",
        props: ['voucher'],
        data() {
            return {}
        }
    }

</script>