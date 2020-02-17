<template>
    <div class="product-card">
        <b-row class="row">
            <b-col cols="8" offset="2" class="text-center p-0">

                <img v-if="service.logo_url" class="logo-img" :src="service.logo_url"/>
                <div class="title">
                    <a :href="`${service.url}`"> {{ service.name }}</a>

                </div>
                <div v-if="service.avg_rate" v-if="service.avg_rate">
                    <div class="rate-container product-stars">
                        <rate :length="5" :value="service.avg_rate" readonly/>
                    </div>
                    <div v-if="service.count_rate" class="reviews-count">{{ service.count_rate }} reviews</div>
                </div>
            </b-col>

            <b-col cols="2" class="d-flex p-0">
                <div>
                    <div class="voucher-count"
                         v-bind:class="{ 'voucher-count-lg': $mq != 'md', 'voucher-count-md': $mq === 'md'}">
                        0
                    </div>
                    <p class="center pr-0">Vouchers</p>
                </div>
            </b-col>
        </b-row>


        <div class="col justify-content-center">
            <b-table-simple borderless small>
                <b-tr v-if="service.minimum_deposit">
                    <b-td class="left">Deposit</b-td>
                    <b-td class="right">{{ service.minimum_deposit ? `$ ${service.minimum_deposit}` : '-'
                        }}
                    </b-td>
                </b-tr>
                <b-tr v-if="service.spread">
                    <b-td class="left">Spread</b-td>
                    <b-td class="right">{{ service.spread ? `${service.spread}` : '-' }}</b-td>
                </b-tr>
                <b-tr v-if="service.leverage">
                    <b-td class="left">Leverage</b-td>
                    <b-td class="right">{{ service.leverage ? `${service.leverage}` : '-' }}x</b-td>
                </b-tr>
                <b-tr v-if="service.commission">
                    <b-td class="left">Commission</b-td>
                    <b-td class="right">${{ service.commission ? `${service.commission}` : '-' }}</b-td>
                </b-tr>
                <b-tr v-if="service.broker_type">
                    <b-td class="left">Broker Type</b-td>
                    <b-td class="right">
                        <div v-for="broker_type in service.broker_type">{{ broker_type }}</div>
                    </b-td>
                </b-tr>
                <b-tr v-if="service.regulation">
                    <b-td class="left">Regulation</b-td>
                    <b-td class="right">

                        <div>
                                    <span v-for="regulation in service.regulation"
                                          :class="`m-1 flag flag-icon flag-icon-squared flag-icon-${
                                              regulation.location.code.toLowerCase()} rounded-circle`"></span>
                        </div>
                    </b-td>
                </b-tr>
            </b-table-simple>
        </div>

        <div class="col row justify-content-center">
            <a class="btn btn-info btn-lg" :href="`${service.url}`">Details</a>
        </div>
    </div>
</template>

<script>


    export default {
        props: ["service"],
    }
</script>