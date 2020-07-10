<template>

    <b-container class="product">
        <b-row class="voucher-discount-row">

            <b-col md="3" align-self="center">
                <img :src="voucher.logo" class="product-image">
                <div class="align-center">
                    <Likes v-if="showLikes" :likes="voucher.likes" :dislikes="voucher.dislikes" :id="voucher.id"></Likes>
                </div>
            </b-col>

            <b-col md="5" align-self="center" class="product-info-discount">

                <p> {{ voucher.name }} </p>
                <div class="vouchers-description" v-html="voucher.description"/>
            </b-col>

            <b-col md="1" align-self="center">

                <div></div>
            </b-col>

            <b-col md="3" align-self="center">

                <div class="product-link-discount  mb-2 d-flex justify-content-center">

                    <a :href="voucher.middleware_url">

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
    import Likes from '../Likes'


    export default {
        name: "fv-vouchers-offer",
        components: {Likes},
        props: { voucher: { type: Object}, showLikes: { type: Boolean, default: true }},
        data() {
            return {}
        }
    }

</script>