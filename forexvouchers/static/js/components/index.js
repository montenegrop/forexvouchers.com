import Comment from './Comments/Comment.vue';
import CommentsList from './Comments/CommentsList.vue';
import Typeahead from './Typeahead/Typeahead.vue';
import CompareTypeahead from './Typeahead/CompareTypeahead.vue';
import Promocodes from './PeelReveal/Promocodes.vue';
import VouchersIndex from './Vouchers/VouchersIndex.vue';
import VouchersLoadAll from './Vouchers/VouchersLoadAll.vue';
import ServicesTable from './HomePage/ServicesTable'


export default {
    'fv-comment': Comment,
    'fv-comments-list': CommentsList,
    'fv-typeahead': Typeahead,
    'fv-compare-typeahead': CompareTypeahead,
    'fv-promocodes': Promocodes,
    'fv-vouchers': VouchersIndex,
    'fv-vouchers-load-all': VouchersLoadAll,
    'fv-services-table': ServicesTable,
}
