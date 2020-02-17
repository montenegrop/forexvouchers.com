<template>
    <div v-if="voucher.type === 'Discount'" class="voucher-discount">
        <fv-discount :voucher="voucher"></fv-discount>
    </div>
    <div v-else-if="voucher.type === 'PromoCode'" class="voucher-promocode">
        <fv-promocode :voucher="voucher"></fv-promocode>
    </div>
    <div v-else="voucher.type === 'Offer'" class="voucher-offer">
        <fv-offer :voucher="voucher"></fv-offer>
    </div>
</template>

<script>
    import FvDiscount from './VoucherDiscount'
    import FvPromocode from './VoucherPromocode'
    import FvOffer from './VoucherOffer'

    export default {
        name: "fv-voucher",
        components: {FvDiscount, FvPromocode, FvOffer},
        props: ['voucher'],
        data() {
            return {}
        }
    }

</script>