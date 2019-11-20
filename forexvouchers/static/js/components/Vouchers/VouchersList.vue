<template>
    <div>
        <div v-for="voucher in vouchers">
            <fv-voucher :voucher="voucher"></fv-voucher>
        </div>
    </div>
</template>


<script>
    import FvVoucher from './Voucher/index'

    export default {
        name: "fv-vouchers-list",
        components: {FvVoucher},
        props: ['vouchers'],
        data() {
            return {}
        }
    }
</script>