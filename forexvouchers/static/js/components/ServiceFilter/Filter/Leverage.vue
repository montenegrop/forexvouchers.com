<template>
    <fv-filter-decorator v-if="brokerness" title="Leverage">
        <div>
            <b-row>
                <b-col cols="9">
                    <div>
                        <b-form @submit="onSubmit" inline>
                            <b-row class="pl-3">
                                <b-col class="m-0 p-0" cols="4">
                                    <b-form-input
                                            v-model="form.from"
                                            class="broker-input-min-lot-size"
                                            size="sm"
                                            id="inline-form-input-leverage-from"
                                            placeholder="From"
                                    ></b-form-input>
                                </b-col>
                                <b-col class="m-0 p-0" cols="4">
                                    <b-form-input
                                            v-model="form.to"
                                            class="broker-input-min-lot-size"
                                            size="sm"
                                            id="inline-form-input-leverage-to"
                                            placeholder="To"
                                    ></b-form-input>

                                </b-col>
                                <b-col cols="4" class="m-0 p-0">
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

    import FvFilterDecorator from '../../FilterDecorator/index'


    export default {
        props: ["brokerness", "minLeverage", "maxLeverage", "onChange"],
        components: {FvFilterDecorator},

        data() {
            return {
                form: {
                    from: '',
                    to: '',
                }
            }
        },
        methods: {
            onSubmit(evt) {
                evt.preventDefault();
                this.onChange(this.form);
            },
        },
    }
</script>