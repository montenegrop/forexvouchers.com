<template>
    <div class="info">Get access to our exclusive forex vouchers <br/>
        Join thousands of forex traders worldwide

        <form method="post" @submit.prevent="submit" v-show="!success" novalidate>
            <div class="input-group subscribe w-50">
                <input type="email"
                       class="form-control"
                       v-model="email"
                       placeholder="Enter email address...">
                <div class="input-group-append">
                    <button class="btn btn-outline-secondary btn-subscribe" type="submit">
                        Subscribe
                    </button>
                </div>
            </div>
            <div v-if="error" class="text-danger">{{ error }}</div>
        </form>
        <div if="success" class="text-success">{{ success }}</div>

    </div>

</template>

<script>
    export default {
        data() {
            return {
                email: '',
                error: '',
                success: ''
            }
        },
        methods: {
            validateEmail(email) {
                var re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
                return re.test(String(email).toLowerCase())
            },
            async submit() {
                this.error = ''

                if (!this.validateEmail(this.email)) {
                    this.error = 'Please, provide a valid email'
                    return;
                }

                var formData = new FormData();
                formData.append('email', this.email);

                try {
                    const x = await this.$http.post(`/api/subscribe`, formData, {
                        headers: {
                            'X-CSRFTOKEN': this.$cookies.get('csrftoken')
                        }
                    });
                    this.success = 'Thanks for subscribing!'
                    this.email = ''
                } catch (e) {
                    if (e.body && e.body.message) {
                        this.error = e.body.message
                    } else {
                        this.error = 'You are not subscribed yet'

                    }
                }

            }
        }
    }
</script>