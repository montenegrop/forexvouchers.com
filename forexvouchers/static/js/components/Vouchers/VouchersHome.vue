<template>
    <div>

        <!-- for mobile -->
        <div class="d-lg-none">
            <carousel class="pt-0 related-vouchers border border-light" perPage="1"
                      autoplay="true" autoplayHoverPause="true">
                <slide v-for="voucher in vouchers">
                    <fv-voucher :voucher="voucher"/>
                </slide>
            </carousel>
        </div>

        <!-- for desktop -->
        <div class="d-none d-lg-block">
            <carousel class="pt-0 related-vouchers border border-light" per-p.age="4"
                      autoplay="true" autoplayHoverPause="true">
                <slide v-for="voucher in vouchers">
                    <fv-voucher :voucher="voucher" :voucherPage="voucherPage"/>
                </slide>
            </carousel>
        </div>


    </div>
</template>

<script>
    import FvVoucher from './VoucherSmall/index'

    export default {
        name: "fv-vouchers-home",
        props: ["service", "sort", "voucherPage", "voucherId"],
        components: {FvVoucher},
        data() {
            return {
                type: 'discount,promocode,offer',
                services: '',
                categories: '',
                vouchers: [],
                startingLetter: '',
                limit: 10,
                sort: '',
                voucher: '',
            }
        },
        watch: {
            type: function () {
                this.getData();
            },
            categories: function () {
                this.getData();
            },
            limit: function () {
                this.getData()
            }
        },
        beforeMount() {
            if (this.voucherPage) {
                this.services = this.service;
                this.sort = 'mostviewed';
                this.voucher = this.voucherId;
            }
        },
        mounted() {
            this.getData()
        },
        methods: {
            async getData() {
                const url = `/api/vouchers?voucher_types=${
                    this.type}&services=${
                    this.services}&categories=${
                    this.categories}&limit=${
                    this.limit}&sort=${
                    this.sort}&voucher_id=${
                    this.voucher}`;
                let response = await this.$http.get(url);
                this.vouchers = response.body.data;
            },

            onTypeChange(value) {
                this.type = value.join(',')
            },
            onServiceChange(value) {
                this.services = value.join(',')
            },
            onCategoryChange(value) {
                this.categories = value.join(',')
            },
            onLetterFilter($event) {
                this.startingLetter = $event.letter;
            },
        },
    }
</script>