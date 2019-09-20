<template>
    <div>
        <FvLetterFilter :options="options">


        </FvLetterFilter>

        <div :class="typeaheadState">
            <div class="typeahead__toggle" ref="toggle" @mousedown.prevent="toggle">
                <input type="text" class="typeahead__search" ref="search"
                       autofocus
                       v-model="search"
                       @focus="onFocus"
                       @blur="onBlur"
                       @keydown.esc="onEscape"
                       @keydown.down="onDownKey"
                       @keydown.up="onUpKey"
                       @keydown.enter="onEnterKey"
                       @load="onLoad(this)"
                >
                <span class="typeahead__text" ref="text">{{displayText}}</span>
            </div>
            <ul class="typeahead__list" ref="list">
                <li class="typeahead__item" v-for="(option, index) in filteredOptions" :key="index">
                    <a class="typeahead__link" @mousedown.prevent="select(option)"
                       :class="[selectIndex === index ? 'typeahead__active':'']"
                    >
                        {{option.text}} <img :src="option.logo"/>
                    </a>
                </li>
            </ul>
        </div>
    </div>

</template>
<script type="text/javascript">

    import LetterFilter from '../LetterFilter'

    export default {
        components: { FvLetterFilter: LetterFilter },
        props: {
            options: {
                type: Array,
                default() {
                    return []
                }
            },
            value: {
                type: [String, Number],
                default: null
            }
        },
        data() {
            return {
                open: false,
                selectIndex: 0,
                displayText: '',
                search: ''
            }
        },
        computed: {
            typeaheadState() {
                return this.open ? 'typeahead typeahead__open' : 'typeahead'
            },
            filteredOptions() {
                const exp = new RegExp(this.search, 'i')
                return this.options.filter((option) => {
                    return (exp.test(option.id) || exp.test(option.text))
                })
            }
        },
        methods: {
            onDownKey() {
                if (this.filteredOptions.length - 1 > this.selectIndex) {
                    this.selectIndex++
                    // scroll when overflow
                    if (this.selectIndex > 2) {
                        this.$refs.list.scrollTop += (20 + this.selectIndex)
                    }
                }
            },
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
                const option = this.filteredOptions[this.selectIndex]
                if (option) {
                    this.select(option)
                }
            },
            select(option) {
                this.displayText = option.text,
                    this.$emit('input', (option.id))
                this.$refs.search.blur()
                location.href = option.link
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
                this.search = ''
                this.selectIndex = 0
                this.$refs.list.scrollTop = 0
                this.open = false
            },
            onEscape() {
                this.$refs.search.blur()
            }
        }
    }
</script>
