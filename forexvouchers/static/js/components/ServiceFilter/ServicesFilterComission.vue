<template>
    <fv-filter-decorator v-if="brokerness" title="Commission $">
        <div>
            <b-row>
                <b-col cols="9">
                    <div>
                        <b-form @submit="onSubmit">
                            <b-row class="pl-3">
                                <b-col class="m-0 p-0" cols="7">
                                    <b-form-input
                                            v-model="form.commission"
                                            class="broker-input-min-lot-size"
                                            size="sm"
                                            id="inline-form-input-commission"
                                            :placeholder="fromMinimum"
                                    ></b-form-input>
                                </b-col>
                                <b-col cols="5" class="m-0 p-0">
                                    <b-button type="submit" class="m-0 broker-input-button-min-lot-size" size="sm"
                                              variant="info">Go
                                    </b-button>
                                </b-col>
                            </b-row>

                        </b-form>
                    </div>
                </b-col>


            </b-row>
        </div>
    </fv-filter-decorator>
</template>

<script>

    import FvFilterDecorator from '../FilterDecorator'


    export default {
        props: ["brokerness", "minimum", "onChange"],
        components: {FvFilterDecorator},

        data() {
            return {
                fromMinimum: '',
                form: {
                    commission: '',
                }
            }
        },
        mounted() {
            this.fromMinimum = 'From $'.concat(this.minimum);
        },
        methods: {
            onSubmit(evt) {
                evt.preventDefault()
                this.onChange(JSON.stringify(this.form.commission))
            },
        },
    }
</script>