<template>

    <div class="col voucher-discount">

        <div class="product">

            <div class="discount-top row">

                <div class="discount-left col-3">

                    <img :src="discount.logo" class="product-image">

                    <div class="container">

                        <div class="row">

                            <div class="col-7 product-service"> By <a class="product-service-link"
                                                                      :href="discount.service_affiliate.url">{{
                                discount.service_name }} </a>
                            </div>

                            <div class="col-5 product-stars rate-container flexible">
                                <rate :length="5" :value="3" readonly/>
                            </div>

                        </div>
                    </div>

                </div>

                <div class="discount-middle col-6 align-self-center">

                    <div class="product-info">
                        <h5 :title="discount.name"> {{ discount.name }} </h5>
                    </div>


                </div>

                <div class="discount-right col-3">
                    <div class="product-discount"> 20% OFF</div>

                    <div class="product-link text-center align-self-center">
                        <a :href="discount.affiliate.url">
                            <button type="button" class="btn btn-info btn-lg product-link-button">
                                Get Discount
                            </button>
                        </a>
                        <div class="product-clicks">
                            <!--{{ discount.clicks }} clicks-->
                        </div>
                        <div class="product-expires">


                            <!--Never expires-->
                            <!--{% else %}-->
                            <!--Expires {{ vouch.expires }}-->
                            <!--{% endif %}-->

                        </div>
                    </div>


                </div>

            </div>


        </div>

    </div>


</template>


<script>

    export default {
        name: "fv-vouchers-discount",
        props: ['discount'],
        data() {
            return {}
        }
    }

</script>