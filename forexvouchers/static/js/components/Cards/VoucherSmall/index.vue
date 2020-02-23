<template>
    <fv-discount-small v-if="voucher.type === 'Discount'" :voucher="voucher" :show-clicks="showClicks" :is-flex="isFlex"></fv-discount-small>
    <fv-promocode-small v-else-if="voucher.type === 'PromoCode'" :voucher="voucher" :show-clicks="showClicks" :is-flex="isFlex"></fv-promocode-small>
    <fv-offer-small v-else="voucher.type === 'Offer'" :voucher="voucher" :show-clicks="showClicks" :is-flex="isFlex"></fv-offer-small>
</template>

<script>
    import FvDiscountSmall from './VoucherDiscountSmall'
    import FvPromocodeSmall from './VoucherPromocodeSmall'
    import FvOfferSmall from './VoucherOfferSmall'

    export default {
        name: "fv-voucher",
        components: {FvDiscountSmall, FvPromocodeSmall, FvOfferSmall},
        props: ['voucher', 'showClicks', 'isFlex'],
        data() {
            return {}
        }
    }
</script>