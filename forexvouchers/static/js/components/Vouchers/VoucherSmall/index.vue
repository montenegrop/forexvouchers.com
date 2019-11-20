<template>
    <div v-if="voucher.type === 'Discount'" class="voucher-discount">
        <fv-discount-small :voucher="voucher"></fv-discount-small>
    </div>
    <div v-else-if="voucher.type === 'PromoCode'" class="voucher-promocode">
        <fv-promocode-small :voucher="voucher"></fv-promocode-small>
    </div>
    <div v-else="voucher.type === 'Offer'" class="voucher-offer">
        <fv-offer-small :voucher="voucher"></fv-offer-small>
    </div>
</template>

<script>
    import FvDiscountSmall from './VoucherDiscountSmall'
    import FvPromocodeSmall from './VoucherPromocodeSmall'
    import FvOfferSmall from './VoucherOfferSmall'

    export default {
        name: "fv-voucher",
        components: {FvDiscountSmall, FvPromocodeSmall, FvOfferSmall},
        props: ['voucher'],
        data() {
            return {}
        }
    }
</script>