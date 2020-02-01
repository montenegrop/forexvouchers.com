<template>
    <fv-filter-decorator v-if="brokerness" title="Broker Type">
        <div>
            <b-row>
                <b-col cols="9">

                    <b-form-group>
                        <b-form-checkbox-group
                                id="checkbox-group-broker-type"
                                class="filter-content option-filter"
                                :value="selected"
                                v-on:input="onChange($event)"
                                :options="options.slice(0, limit).map(option=> ({text: option.name, value: option.id}))"
                                name="flavour-1"
                                stacked
                        />
                    </b-form-group>
                </b-col>
            </b-row>

            <div v-if="limit < options.length">
                <a class="show-more-button" href="#"
                   @click.stop.prevent="limit += limitIncrease">
                    <u>more choices</u>
                </a>
            </div>
        </div>
    </fv-filter-decorator>
</template>

<script>

    import FvFilterDecorator from '../../FilterDecorator/index'

    export default {
        props: ["brokerness", "options", "onChange"],
        components: {FvFilterDecorator},
        data() {
            return {
                limit: 5,
                limitIncrease: 5,
            }
        }
    }
</script>