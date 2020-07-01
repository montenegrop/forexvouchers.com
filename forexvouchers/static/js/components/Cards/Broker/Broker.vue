<template>
    <div class="product-card">
        <div class="d-flex row">
            <div class="offset-3 col-6 col-md-5 col">

                <img v-if="service.logo_url" class="logo-img" :src="service.logo_url"/>
                <div class="product-info hover-link">
                    <a :href="`${service.url}`">
                        <h5 :title="service.name"> {{ service.name }} </h5>
                    </a>
                </div>
                <div v-if="service.avg_rate">
                    <div class="rate-container product-stars">
                        <rate :length="5" :value="service.avg_rate" readonly/>
                    </div>
                    <div v-if="service.count_rate" class="reviews-count">{{ service.count_rate }} reviews</div>
                </div>
            </div>

            <div class="col-3 col-md-4 col d-flex justify-content-center">
                <div class="voucher-count-float-right">
                    <div class="voucher-count"
                         v-bind:class="{ 'voucher-count-lg': $mq != 'md', 'voucher-count-md': $mq === 'md'}">
                        {{ service.voucher_count }}
                    </div>
                    <p class="center pr-0">Vouchers</p>
                </div>
            </div>
        </div>

        <div class="col justify-content-center">
            <b-table-simple borderless small>
                <b-tr v-if="service.minimum_deposit">
                    <b-td class="left pb-0 pt-0">Deposit</b-td>
                    <b-td class="right pb-0 pt-0">{{ service.minimum_deposit ? `$ ${service.minimum_deposit}` : '-'
                        }}
                    </b-td>
                </b-tr>
                <b-tr v-if="service.spread">
                    <b-td class="left pb-0 pt-0">Spread</b-td>
                    <b-td class="right pb-0 pt-0">{{ spreadFloat(service.spread) }}</b-td>
                </b-tr>
                <b-tr v-if="service.leverage">
                    <b-td class="left pb-0 pt-0">Leverage</b-td>
                    <b-td class="right pb-0 pt-0">{{ service.leverage ? `${service.leverage}` : '-' }}x</b-td>
                </b-tr>
                <b-tr v-if="service.commission">
                    <b-td class="left pb-0 pt-0">Commission</b-td>
                    <b-td class="right pb-0 pt-0">${{ service.commission ? ` ${service.commission}` : '-' }}</b-td>
                </b-tr>
                <b-tr v-if="service.broker_type">
                    <b-td class="left pb-0 pt-0">Broker Type</b-td>
                    <b-td class="right pb-0 pt-0">
                        <div v-for="broker_type in service.broker_type">{{ broker_type }}</div>
                    </b-td>
                </b-tr>
                <b-tr v-if="service.regulation">
                    <b-td class="left pb-0 pt-0">Regulation</b-td>
                    <b-td class="right pb-0 pt-0">
                        <template v-for="regulation in service.regulation">
                            <span v-b-tooltip.hover
                                  :title="`${regulation.code} - ${regulation.description}`"
                                  :class="`m-1 flag flag-icon flag-icon-squared flag-icon-${
                                              regulation.location.code.toLowerCase()} rounded-circle`"
                            >
                            </span>
                        </template>
                    </b-td>
                </b-tr>
            </b-table-simple>
        </div>

        <div class="d-flex justify-content-center pb-3">
            <a class="btn btn-info btn-lg" :href="`${service.url}`">Details</a>
        </div>
    </div>
</template>

<script>
    export default {
        props: ["service"],
        methods: {
            spreadFloat(spread) {
                return parseFloat(spread).toFixed(1)
            },
        },
    }
</script>