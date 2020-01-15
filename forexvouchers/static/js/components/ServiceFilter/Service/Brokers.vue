<template>
    <div class="row">
        <div class="service-summary col-md-6" v-for="service in services">
            <div class="product">
                <div class="row">
                    <div class="col-3 col mt-4 d-flex justify-content-center">

                        <fv-check :status="status(service)" :slug="service.slug"
                                  v-on:serviceSelected="checkForCompare($event)">
                        </fv-check>

                        <fv-button-compare class="compare-button"
                                           v-show="selected[1] === service.slug && selected.length === 2"
                                           :comparing="selected"></fv-button-compare>

                    </div>

                    <div class="col-6 col">

                        <img class="logo-img" :src="service.logo_url"/>
                        <div class="title">
                            <a :href="`/services/${service.slug}`"> {{ service.name }}</a>

                        </div>
                        <div v-if="service.avg_rate">
                            <div class="rate-container product-stars">
                                <rate :length="5" :value="service.avg_rate" readonly/>
                            </div>
                            <div v-if="service.avg_rate" class="reviews-count">{{ service.count_rate }} reviews</div>
                        </div>
                    </div>


                    <div class="col-3 col row justify-content-center">
                        <div>
                            <div class="voucher-count">
                                0
                            </div>
                            Vouchers
                        </div>
                    </div>
                </div>
                <div class="col row justify-content-center">
                    <table>
                        <tr>
                            <td class="right">Deposit</td>
                            <td class="left">{{ service.minimum_deposit ? `$ ${service.minimum_deposit}` : '-'
                                }}
                            </td>
                        </tr>
                        <tr>
                            <td class="right">Spread</td>
                            <td class="left">{{ service.spread ? `${service.spread}` : '-' }}</td>
                        </tr>
                        <tr>
                            <td class="right">Leverage</td>
                            <td class="left">{{ service.leverage ? `${service.leverage}` : '-' }}</td>
                        </tr>
                        <tr>
                            <td class="right">Commission</td>
                            <td class="left">{{ service.commission ? `${service.commission}` : '-' }}</td>
                        </tr>
                        <tr>
                            <td class="right">Broker Type</td>
                            <td class="left">
                                <div v-for="broker_type in service.broker_type">{{ broker_type }}</div>

<!--                               <div v-for="country in service.location">-->
<!--                                   <span :class="'flag flag-icon flag-icon-squared flag-icon-' + country.code.toLowerCase() + ''"></span>-->
<!--                                   {{ country.name }}-->
<!--                               </div>-->

                            </td>
                        </tr>
                        <tr>
                            <td class="right">Regulation</td>
                            <td class="left">

                                <div v-for="regulation in service.regulation">
                                    {{ regulation.code }}
                                </div>
                            </td>
                        </tr>
                    </table>
                </div>
                <div class="col row justify-content-center">
                    <a class="btn btn-info btn-lg" :href="`/services/${service.slug}`">Details</a>
                </div>
            </div>
        </div>
    </div>
</template>


<script>

    import FvCheck from './FilterCheck'
    import FvButtonCompare from './ButtonCompare'

    export default {
        components: {FvCheck, FvButtonCompare},
        props: ['services', 'selected'],

        methods: {
            checkForCompare($event) {
                this.$emit('serviceSelected', {ser_slug: $event.ser_slug, count: $event.count})
            },
            status(service) {
                return this.selected.includes(service.slug) ? service.slug : 'not-selected';
            },
        },
    }
</script>