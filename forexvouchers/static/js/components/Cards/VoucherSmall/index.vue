<template>
    <fv-discount-small v-if="voucher.type === 'Discount'" :voucher="voucher" :voucherPage="true"></fv-discount-small>
    <fv-promocode-small v-else-if="voucher.type === 'PromoCode'" :voucher="voucher"></fv-promocode-small>
    <fv-offer-small v-else="voucher.type === 'Offer'" :voucher="voucher"></fv-offer-small>
</template>

<script>
    import FvDiscountSmall from './VoucherDiscountSmall'
    import FvPromocodeSmall from './VoucherPromocodeSmall'
    import FvOfferSmall from './VoucherOfferSmall'

    export default {
        name: "fv-voucher",
        components: {FvDiscountSmall, FvPromocodeSmall, FvOfferSmall},
        props: ['voucher', 'voucherPage'],
        data() {
            return {}
        }
    }
</script>