<template>
    <table class="table table-dark services-table">
        <thead>
        <tr>
            <th scope="col">#</th>
            <th scope="col">Name</th>
            <th scope="col">Country + Regulation</th>
            <th scope="col">Broker type</th>
            <th scope="col">Minimum Deposit</th>
            <th scope="col">Leverage</th>
            <th scope="col">Spread</th>
            <th scope="col">Comission Fee</th>
            <th scope="col">Rating & Reviews</th>

        </tr>
        </thead>
        <tbody>
        <tr v-for="(service, index) in rows">
            <th scope="row">{{ index + 1}}</th>
            <td>
                <a :href="`/services/${service.slug}`">
                    <img :src="service.logo_url" height="25"/> {{ service.name }}
                </a>
            </td>
            <td>
                <div class="country-regulation">

                    <div>
                        <div v-for="country in service.location">
                            <span :class="'flag flag-icon flag-icon-squared flag-icon-' + country.code.toLowerCase() + ''"></span>
                            {{ country.name }}
                        </div>
                    </div>
                    <div>
                        <div v-for="regulation in service.regulation">
                            {{ regulation.code }}
                        </div>
                    </div>
                </div>
            </td>

            <td>
                <div v-for="broker_type in service.broker_type">{{ broker_type }}</div>
            </td>
            <td>{{ service.minimum_deposit ? `$ ${service.minimum_deposit}` : '-' }}</td>
            <td>{{ service.leverage ? `${service.leverage}` : '-' }}</td>
            <td>{{ service.spread ? `${service.spread}` : '-' }}</td>
            <td>-</td>
            <td>
                <div v-if="service.avg_rate">
                    <div class="rate-container">
                        <rate :length="5" :value="service.avg_rate" readonly/>
                    </div>
                    <div class="reviews-count">{{ service.count_rate }} reviews</div>
                </div>
            </td>

        </tr>
        </tbody>
    </table>
</template>


<script>
    const cache = {};
    export default {
        props: ['options'],
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

