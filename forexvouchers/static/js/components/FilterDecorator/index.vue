<template>
    <div v-if="!show">
        <b-row>
            <b-col cols="10">
                <h5 class="filter-titles">{{ title }}</h5>
            </b-col>
            <b-col cols="2">
                <b-link
                        :class="visible ? null : 'collapsed'"
                        :aria-expanded="visible ? 'true' : 'false'"
                        aria-controls="collapse-4"
                        @click="visible = !visible"
                        variant="info"
                >

                    <i v-bind:class=" {'fas fa-arrow-circle-down arrows': visible, 'fas fa-arrow-circle-right arrows': !visible}"></i>

                    <!--                    <a href="#" style="background-color: red">-->
                    <!--                        <div  v-bind:class=" {'fa fa-chevron-up rotate.down': visible, 'fa fa-chevron-up rotate': !visible}"></div>-->
                    <!--                    </a>-->
                    <!--                    <i v-if="!visible" class="fas fa-arrow-circle-right arrows"></i>-->

                </b-link>
            </b-col>
        </b-row>
        <b-collapse id="collapse-4" v-model="visible" class="mt-2">
            <slot></slot>
        </b-collapse>

    </div>
</template>

<script>

    export default {
        name: "fv-filter-decorator",
        props: ['title', 'show'],
        data() {
            return {
                visible: true
            }
        }
    }

</script>