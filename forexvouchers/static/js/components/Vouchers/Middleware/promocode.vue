<template>
    <div class="container middleware-main">
        <h2 class="title"> {{ voucher.name }}</h2>
        <div class="row border border-light no-float ">

            <div class="col information">

                <div class="col-auto image text-align-center mt-0">
                    <img :src="voucher.logo">

                    <p class="text-dark font-weight-bold mb-0">By: <a class="product-service-link"
                                                                      :href="voucher.service_url">{{
                        voucher.service_name }}</a></p>

                    <b-col class="col-auto product-stars rate-container flexible voucher-info-service pl-3">

                        <rate :length="5" :value="voucher.service_rate" readonly/>
                    </b-col>
                </div>

                <div class="row description mx-5" v-html="voucher.description"></div>
                <div class="row icons justify-content-center">

                    <p v-if="voucher.never_expires" class="icons text-success">
                        <i class="fas fa-hourglass-half"></i> Never Expires
                    </p>

                    <p v-else class="icons"><i class="fas fa-hourglass-half"></i>
                        Expires in:&nbsp;
                        <timeago :datetime="voucher.expires"></timeago>
                    </p>

                </div>

                <div class="row button button-container">
                    <div class="button-border">
                        <a @click="revealed" v-if="!showCode" target="_blank" :href="voucher.affiliate.url">
                            <b-button squared variant="info" class="button-get-code button-large">
                                Get Code
                            </b-button>
                        </a>

                        <div v-if="showCode" class="button-code">
                            <h3 class="text-code no-shadow text-primary mb-1">{{ voucher.code }}</h3>
                            <b-button variant="dark" class="copy-code">copy</b-button>
                        </div>
                    </div>
                </div>

                <div class="product-service row">
                    <b-col>

                        <p class="mb-0"><i class="fas fa-external-link-square-alt"></i>
                            <a class="product-service-link"
                               :href="voucher.service_affiliate.url" target="_blank">website</a>

                        </p>


                        <p><i class="fas fa-eye"></i>
                            {{ clicks_large }} Views
                        </p>
                    </b-col>
                    <b-col class="text-right">
                        <Likes classes="btn btn-sm likes-width" :likes="voucher.likes" :dislikes="voucher.dislikes"
                               :id="voucher.id"></Likes>
                    </b-col>
                </div>
            </div>
        </div>

        <div class="mt-2 mb-5">
            <h5 class="title text-left mb-0 title-more-vouchers">Related Vouchers:</h5>
            <fv-vouchers-home class="VueCarousel-inner-margin" :service-id="voucher.service_id" sort="mostviewed"
                              :voucher-id="voucher.id">
            </fv-vouchers-home>

            <div class="show-more right">
                <a size="sm" href="/vouchers">More Vouchers</a>
            </div>
        </div>


    </div>

</template>


<script>
    import Likes from "../../Cards/Likes"

    export default {
        name: "fv-middleware-promocode",
        props: {
            vouch: { type: Object },
            clicks_large: {
                default: '0',
                type: String
            }
        },
        components: {Likes},
        data() {
            return {
                showCode: false,
                voucher: JSON.parse(this.vouch),
            }
        },
        methods: {
            revealed: function () {
                this.showCode = true
            },
        },
    }
</script>
