<template>
    <div class="container middleware-main">
        <h2 class="title"> {{ voucher.type }} information </h2>
        <div class="row border border-light no-float ">
            <div class="col-auto image">
                <img :src="voucher.service_logo_big">

                <b-col class="col-auto product-stars rate-container flexible voucher-info-service pl-3">

                    <rate :length="5" :value="voucher.service_rate" readonly/>
                </b-col>
            </div>
            <div class="col information">
                <div class="row  product-info-discount name">
                    <h3>{{ voucher.name }}</h3>
                    <h4 class="discount">{{ voucher.discount_percent }}% OFF</h4>
                </div>
                <div class="row  description" v-html="voucher.description"></div>
                <div class="row  icons">

                    <p v-if="voucher.never_expires" class="icons">
                        <i class="fas fa-hourglass-half"></i> Never Expires
                    </p>


                    <p v-else class="icons"><i class="fas fa-hourglass-half"></i>
                        Expires in:&nbsp;
                        <timeago :datetime="voucher.expires"></timeago>
                    </p>

                </div>
                <div class="row button button-container">
                    <div class=" button-border">
                        <a target="_blank" target="_blank" :href="voucher.affiliate.url">
                            <b-button squared variant="info" class="button-get-code button-large">
                                Get Discount
                            </b-button>
                        </a>
                    </div>
                </div>

                <div class="product-service">
                    <p>
                        <i class="fas fa-external-link-alt"></i>
                        Go <a class="product-service-link"
                              :href="voucher.service_url"><u>{{ voucher.service_name }}</u> </a> in-site page
                    </p>

                    <p><i class="fas fa-external-link-square-alt"></i>
                        External <a class="product-service-link"
                                    :href="voucher.service_affiliate.url"><u>{{ voucher.service_name }}</u> </a> website
                    </p>

                    <p><i class="fas fa-eye"></i>
                        {{ voucher.affiliate.clicks }} Views
                    </p>
                        <Likes classes="btn btn-sm" :likes="voucher.likes" :dislikes="voucher.dislikes" :id="voucher.id"></Likes>
                </div>
            </div>
        </div>

        <div class="mt-2 mb-5">
            <h5 class="title text-left mb-0 title-more-vouchers">Related Coupons:</h5>
            <fv-vouchers-home class="VueCarousel-inner-margin" sort="mostviewed"></fv-vouchers-home>

            <div class="show-more right">
                <a size="sm" href="/vouchers">More Vouchers</a>
            </div>
        </div>
    </div>
</template>


<script>

    import VouchersHome from "../VouchersHome";
    import Likes from "../../Cards/Likes"


    export default {
        name: "fv-middleware-discount",
        components: {FvVouchersHome: VouchersHome, Likes},
        props: ["vouch"],
        data() {
            return {
                voucher: JSON.parse(this.vouch),
            }
        }
    }
</script>
