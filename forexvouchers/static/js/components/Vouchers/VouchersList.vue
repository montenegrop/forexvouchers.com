<template>
    <div>
        <div v-for="voucher in vouchers">
            <fv-voucher :voucher="voucher" :show-likes="false"></fv-voucher>
        </div>
    </div>
</template>


<script>
    import FvVoucher from '../Cards/Voucher/index'

    export default {
        name: "fv-vouchers-list",
        components: {FvVoucher},
        props: ['vouchers'],
        data() {
            return {}
        }
    }
</script>