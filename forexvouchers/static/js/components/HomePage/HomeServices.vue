<template>
    <div class="row">
        <div class="service-summary col-md-6" v-for="service in rows">
            <div class="product">
                <div class="row">
                    <div class="col-4 col">
                        <img class="logo-img" :src="service.logo_url"/>
                        <div class="title">
                            <a :href="`${service.url}`"> {{ service.name }}</a>

                        </div>
                        <div v-if="service.avg_rate">
                            <div class="rate-container">
                                <rate :length="5" :value="service.avg_rate" readonly/>
                            </div>
                            <div class="reviews-count">{{ service.count_rate }} reviews</div>
                        </div>
                    </div>
                    <div class="col-4 col">
                        <table>
                            <tr>
                                <td class="right">Deposit</td>
                                <td class="left">{{ service.minimum_deposit ? `$ ${service.minimum_deposit}` : '-' }}
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
                                    <!-- v-for="country in service.location">
                                                <span :class="'flag flag-icon flag-icon-squared flag-icon-' + country.code.toLowerCase() + ''"></span>
                                                {{ country.name }}
                                            </-->

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
                    <div class="col-4 col row justify-content-center">
                        <div>
                            <div class="voucher-count">
                                0
                            </div>
                            Vouchers
                        </div>
                        <div>
                            <a class="btn btn-info btn-lg" :href="`${service.url}`">Details</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


</template>


<script>
    const cache = {};
    export default {
        data() {
            return {
                rows: [],
                perPage: 10,
            }
        },
        mounted() {
            this.getData();
        },
        methods: {
            async getData() {
                const url = `/api/services?page=0&limit=${this.perPage}`;
                let response;
                if (cache.hasOwnProperty(url)) {
                    response = cache[url];
                } else {
                    response = (await
                        this.$http.get(url)).data;
                    cache[url] = response;
                }

                this.rows = [...response.data];
            }
        }
    }
</script>

