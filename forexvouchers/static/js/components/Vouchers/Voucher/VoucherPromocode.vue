<template>

    <b-container class="product">

        <b-row class="voucher-discount-row">

            <b-col md="3" align-self="center">

                <img :src="voucher.logo" class="product-image">
            </b-col>

            <b-col md="5" align-self="center" class="product-info-discount">

                <p> {{ voucher.name }} </p>
                <div class="vouchers-description" v-html="voucher.description"/>
            </b-col>

            <b-col md="1" align-self="center">

                <div></div>
            </b-col>

            <b-col md="3" align-self="center">

                <div class="product-link-discount">

                    <a :href="voucher.middleware_url">

                        <button type="button" class="btn btn-info btn-lg product-link-button">

                            Show Code
                        </button>
                    </a>
                </div>
            </b-col>
        </b-row>

        <b-row class="voucher-info">
            <b-col class="col-auto product-service voucher-info-service">

                By
                <a class="product-service-link"
                   :href="voucher.service_url">
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

    import FvPromocodeButton from '../VoucherPromocodeButton'

    export default {
        name: "fv-vouchers-promocode",
        components: {FvPromocodeButton},
        props: ['voucher'],
        data() {
            return {}
        }
    }
</script>