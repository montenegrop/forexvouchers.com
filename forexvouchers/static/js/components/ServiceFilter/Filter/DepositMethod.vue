<template>
    <fv-filter-decorator v-if="brokerness" title="Desposit Method">
        <div>
            <b-row>
                <b-col cols="9">

                    <b-form-group>
                        <b-form-checkbox-group
                                id="checkbox-group-deposit-method"
                                class="filter-content option-filter"
                                :value="selected"
                                v-on:input="onChange($event)"
                                :options="options.slice(0, limit).map(option=> ({text: option.name, value: option.id}))"
                                name="flavour-1"
                                stacked
                        />
                    </b-form-group>
                </b-col>

                <b-col v-show="brokerness" cols="3" class="m-0 p-0 checkbox-amount">
                    <b-list-group>
                        <b-list-group-item v-for="option in options.slice(0, limit)"
                                           class="p-0 m-0 border-0 list-group-item"><p
                                class="mt-0 mb-0"> ({{option.total}})</p>
                        </b-list-group-item>
                    </b-list-group>
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