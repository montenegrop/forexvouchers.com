<template>
    <div class="row home-filters">
        <div class="container form-container">
            <div class="input-group mt-2 mb-2">
                <input class="form-control"
                       placeholder="Search for vouchers, brokers or services ..."
                       type="text"
                       name="search"
                       ref="search"
                       autofocus
                       v-model="search"
                       @focus="onFocus"
                       @blur="onBlur"
                       @keydown.esc="onEscape"
                       @keydown.down="onDownKey"
                       @keydown.up="onUpKey"
                       @keydown.enter="onEnterKey"
                       @load="onLoad(this)"
                       autocomplete="off"
                >
                <div class="input-group-append">
                    <b-button :size="$mq === 'sm' ? 'md' : $mq" class="btn btn-info" @click="onSubmit">
                        search
                    </b-button>
                </div>
                <span class="typeahead__text" ref="text">{{displayText}}</span>
            </div>

            <div class="results" v-if="open">
                <div class="card">

                    <div class="spinner" v-if="loading">
                        <b-spinner type="grow" variant="info" label="Loading..."></b-spinner>
                        <span class="spinner-text">Searching</span>
                    </div>

                    <div class="message">
                        <span class="error"
                              v-if="errorNothingFound">No matches were found for your query "{{ search }}"</span>
                    </div>


                    <ul class="typeahead__list" ref="list">

                        <li class="typeahead__item" v-for="(option, index) in options" :key="index">
                            <template v-if="option.type == 'service'">
                                <a class="typeahead__link"
                                   @mousedown.prevent="select(option)"
                                   :class="[selectIndex === index ? 'typeahead__active':'']"
                                >
                                    <img :src="option.data.logo_url_small"/>
                                    {{option.data.name}}
                                    <span class="badge badge-info" v-for="cat_id in option.data.categories">
                                        {{ getCategoryName(cat_id)}}
                                    </span>
                                </a>
                            </template>

                            <template v-else>
                                <a class="typeahead__link"
                                   @mousedown.prevent="select(option)"
                                   :class="[selectIndex === index ? 'typeahead__active':'']"
                                >
                                    <img :src="option.data.logo_url_small"/>
                                    {{option.data.name}}
                                    <span class="badge badge-danger">{{ option.data.type }}</span>
                                </a>
                            </template>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</template>


<script>

    import _ from 'lodash'

    export default {
        props: {
            categories: []
        },
        data() {
            return {
                open: false,
                selectIndex: 0,
                search: '',
                loading: false,
                options: []
            }
        },
        watch: {
            search() {
                this.loading = true
                this.submitSearchDebounced()
            }
        },
        methods: {
            getCategoryName(id) {
                const category = this.categories.find(cat => cat.id === id);
                return category.name
            },
            onDownKey() {
                if (this.options.length - 1 > this.selectIndex) {
                    this.selectIndex++
                    // scroll when overflow
                    if (this.selectIndex > 2) {
                        this.$refs.list.scrollTop += (20 + this.selectIndex)
                    }
                }
            },
            async submitSearch() {
                this.loading = true
                this.open = true

                let response;

                try {
                    const url = `/api/search?query=${this.search}`;
                    response = await this.$http.get(url);
                    this.options = response.body.data;
                    this.selectIndex = 0

                } catch (e) {
                    console.error('Error in search', e);
                }

                this.loading = false;
            },
            submitSearchDebounced: _.debounce(function () {
                this.submitSearch()
            }, 2000),
            onUpKey() {
                if (this.selectIndex > 0) {
                    this.selectIndex--
                    // scroll when overflow
                    if (this.selectIndex > 0) {
                        this.$refs.list.scrollTop -= (20 + this.selectIndex)
                    }
                }
            },
            onEnterKey() {
                const option = this.options[this.selectIndex]
                if (option) {
                    this.select(option)
                }
            },
            select(option) {
                location.href = option.data.url
            },
            toggle(e) {
                if (e.target === this.$refs.toggle ||
                    e.target === this.$refs.search ||
                    e.target === this.$refs.text) {
                    if (this.open) {
                        if (e.target !== this.$refs.search &&
                            e.target !== this.$refs.text) {
                            this.$refs.search.blur()
                        }
                    } else {
                        this.$refs.search.focus()
                    }
                }
            },
            onFocus() {
                this.open = true
            },
            onBlur() {
                this.selectIndex = 0
                this.$refs.list.scrollTop = 0
                this.open = false
            },
            onEscape() {
                this.$refs.search.blur()
            },
            onSubmit() {
                this.$refs.search.focus()
                this.submitSearch()
            }
        },
        computed: {
            errorNothingFound() {
                return this.search && this.loading === false && this.options.length === 0
            }
        }
    }
</script>