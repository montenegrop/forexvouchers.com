<template>

    <b-container class="product voucher-discount">

        <b-row class="voucher-discount-row">

            <b-col cols="3" align-self="center">

                <img :src="discount.logo" class="product-image">
            </b-col>

            <b-col cols="5" align-self="center" class="product-info-discount">

                <p> {{ discount.name }} </p>
            </b-col>

            <b-col cols="1" align-self="center">

                <div class="discount-discount">20% OFF</div>
            </b-col>

            <b-col cols="3" align-self="center">

                <div class="product-link-discount">

                    <a :href="discount.affiliate.url">

                        <button type="button" class="btn btn-info btn-lg product-link-button">

                            Get Discount
                        </button>
                    </a>
                </div>
            </b-col>
        </b-row>
    </b-container>

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