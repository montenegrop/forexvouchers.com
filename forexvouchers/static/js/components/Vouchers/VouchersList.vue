<template>
    <div>
        <div v-for="voucher in vouchers">
            <div v-if="voucher.type === 'Discount'" class="voucher-discount">
                <fv-discount :discount="voucher"></fv-discount>
            </div>
            <div v-else-if="voucher.type === 'PromoCode'" class="voucher-promocode">
                <fv-promocode :discount="voucher"></fv-promocode>
            </div>
            <div v-else="voucher.type === 'Offer'" class="voucher-offer">
                <fv-offer :discount="voucher"></fv-offer>
            </div>
        </div>
    </div>
</template>


<script>
    import FvDiscount from './VouchersDiscount'
    import FvPromocode from './VouchersPromocode'
    import FvOffer from './VouchersOffer'

    export default {
        name: "fv-vouchers-list",
        components: {FvDiscount,FvPromocode,FvOffer},
        props: ['vouchers'],
        data() {
            return {}
        }

    }

</script>