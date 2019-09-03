<template>
    <b-container>
        <b-row v-if="total" class="infoAndImage">
            <b-col cols="5">
                <div class="stars-filter-total"><h5>{{ total }} reviews</h5></div>
                <div class="stars-filter-item">
                    <div class="stars-label"><a href="#" @click="change(5, $event)">Stars 5</a></div>
                    <div class="stars-progress-bar">
                        <b-progress :value="stars5 / total * 100" variant="warning" :animated="animate"/>
                    </div>
                </div>
                <div class="stars-filter-item">
                    <div class="stars-label"><a href="#" @click="change(4, $event)">Stars 4</a></div>
                    <div class="stars-progress-bar">
                        <b-progress :value="stars4 / total * 100" variant="warning" :animated="animate"/>
                    </div>
                </div>
                <div class="stars-filter-item">
                    <div class="stars-label"><a href="#" @click="change(3, $event)">Stars 3</a></div>
                    <div class="stars-progress-bar">
                        <b-progress :value="stars3 / total * 100" variant="warning" :animated="animate"/>
                    </div>
                </div>
                <div class="stars-filter-item">
                    <div class="stars-label"><a href="#" @click="change(2, $event)">Stars 2</a></div>
                    <div class="stars-progress-bar">
                        <b-progress :value="stars2 / total * 100" variant="warning" :animated="animate"/>
                    </div>
                </div>
                <div class="stars-filter-item">
                    <div class="stars-label"><a href="#" @click="change(1, $event)">Stars 1</a></div>
                    <div class="stars-progress-bar">
                        <b-progress :value="stars1 / total * 100" variant="warning" :animated="animate"/>
                    </div>
                </div>
            </b-col>
            <b-col cols="6">
                <div class="center-vertical-horizontal">
                    <button type="submit" @click="scroll" class="btn btn-info pull-right">SUBMIT REVIEW</button>
                </div>
            </b-col>
        </b-row>
    </b-container>
</template>

<script>

    export default {
        name: "fv-comments-stars-filter",
        props: ['stars1', 'stars2', 'stars3', 'stars4', 'stars5', 'total'],
        data() {
            return {}
        }, methods: {
            change(stars, e) {
                e.preventDefault();
                this.$emit('filterChange', stars);
            },
            scroll(e) {
                this.$emit('onGoToSubmitForm')
            }
        }
    };
</script>

