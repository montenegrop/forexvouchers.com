<template>
    <div>

        <!-- for mobile -->
        <div class="d-lg-none">
            <carousel perPage="1" autoplay="true" autoplayHoverPause="true">
                <slide v-for="voucher in vouchers">
                    <fv-voucher :voucher="voucher"/>
                </slide>
            </carousel>
        </div>

        <!-- for desktop -->
        <div class="d-none d-lg-block">
            <carousel perPage="4" autoplay="true" autoplayHoverPause="true">
                <slide v-for="voucher in vouchers">
                    <fv-voucher :voucher="voucher"/>
                </slide>
            </carousel>
        </div>


    </div>
</template>

<script>
    import FvVoucher from './VoucherSmall/index'

    export default {
        name: "fv-vouchers-home",
        components: {FvVoucher},
        data() {
            return {
                type: 'discount,promocode,offer',
                services: '',
                categories: '',
                vouchers: [],
                startingLetter: '',
                limit: '10',
            }
        },
        watch: {
            type: function () {
                this.getData();
            },
            services: function () {
                this.getData();
            },
            categories: function () {
                this.getData();
            },
            limit: function () {
                this.getData()
            }
        },
        mounted() {
            this.getData()
        },
        methods: {
            async getData() {
                const url = `/api/vouchers?voucher_types=${this.type}&services=${this.services}&categories=${this.categories}&limit=${this.limit}`;
                let response = await this.$http.get(url);
                this.vouchers = response.body.data;
                this.limit = response.body.limit;
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