<template>
    <b-alert v-if="showMessage" show variant="success">Thanks your message has been posted successfully!</b-alert>
    <form v-else="showMessage" action="/savecomment" method="post" @submit="checkForm">

        <div class="panel-body">
            <b-form-group
                    label="Select a rate:"
                    label-for="rate"
                    :invalid-feedback="this.errors.rate"
                    :state="this.submitted ? !!this.errors.rate : null"
            >
                <div class="rate-container">
                    <rate :length="5" v-model="rate" name="rate"/>
                </div>
                <div v-if="!!this.errors.rate" class="text-danger">
                    {{ this.errors.rate }}
                </div>
            </b-form-group>


            <b-form-group
                    label="Enter your name"
                    label-for="name"
                    :invalid-feedback="this.errors.name"
                    :state="this.submitted ? !!this.errors.name : null"
            >
                <b-form-input :state="this.submitted ? !this.errors.name : null" v-model="name"/>
            </b-form-group>


            <b-form-group
                    label="Enter your email"
                    label-for="email"
                    :invalid-feedback="this.errors.email"
                    :state="this.submitted ? !!this.errors.email : null"
            >
                <b-form-input :state="this.submitted ? !this.errors.email : null" type="email" v-model="email"/>
            </b-form-group>

            <b-form-group
                    label="Leave a comment"
                    label-for="review"
                    :invalid-feedback="this.errors.review"
                    :state="this.submitted ? !!this.errors.review : null"
            >
                <b-form-textarea v-model="review" name="review" rows="3"
                                 :state="this.submitted ? !this.errors.review : null"/>
            </b-form-group>

            <button type="submit" class="btn btn-info pull-right">Post</button>
            <div class="clearfix"></div>
        </div>
    </form>
</template>

<script>
    export default {
        name: "fv-comments-form",
        props: ['service_id', 'showMessage'],
        data() {
            return {
                errors: {},
                submitted: false,
                name: null,
                review: null,
                email: null,
                rate: null,
            }
        },
        methods: {
            checkForm: function (e) {
                this.errors = {};
                this.submitted = true;


                e.preventDefault();

                if (!this.name) {
                    this.errors.name = 'Name is required.';
                }

                if (!this.review) {
                    this.errors.review = 'Comment is required';
                }

                if (!this.email) {
                    this.errors.email = 'Email is required.';
                } else if (/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(this.email) == false) {
                    this.errors.email = 'Please use a valid email';
                }


                if (!this.rate) {
                    this.errors.rate = 'Please evaluate this service';
                }

                if (Object.keys(this.errors).length === 0) {
                    const {email, review, name, rate} = this;
                    this.$emit('post', {
                        email, review, name, rate
                    });

                }
                return false;

            }
        }
    };
</script>
