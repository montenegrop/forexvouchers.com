<template>
    <div>
        <button :class="classes + ' small'" @click="addLike">
            <i class="fa fa-thumbs-up p-1"><span class="pl-1">{{ likes_count }}</span></i>
        </button>
        <button :class="classes + ' small'" @click="addDislike">
            <i class="fa fa-thumbs-down"><span class="pl-1">{{ dislikes_count }}</span></i>
        </button>
    </div>
</template>

<script>

    export default {
        name: "fv-likes",
        props: ['likes', 'dislikes', 'id', 'classes'],
        data() {
            return {
                likes_count: this.likes,
                dislikes_count: this.dislikes
            }
        },
        methods: {
            addLike() {
                const ls = 'like_' + this.id;

                if (localStorage[ls]) {
                    return
                }
                localStorage[ls] = '1'

                this.likes_count++;

                this.post('1')

            },
            addDislike() {
                const ls = 'like_' + this.id;

                if (localStorage[ls]) {
                    return
                }
                localStorage[ls] = '1'

                this.dislikes_count++;

                this.post('')

            },
            post(like) {
                var formData = new FormData();
                formData.append('id', this.id);
                formData.append('like', like);

                this.$http.post(`/api/likes`, formData, {
                    headers: {
                        'X-CSRFTOKEN': this.$cookies.get('csrftoken')
                    }
                })

            }
        }
    }

</script>