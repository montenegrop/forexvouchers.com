import Comment from './Comments/Comment.vue';
import CommentsList from './Comments/CommentsList.vue';
import Typeahead from './Typeahead/Typeahead.vue';
import CompareTypeahead from './Typeahead/CompareTypeahead.vue';
import Promocodes from './PeelReveal/Promocodes.vue';
import VouchersView from './Vouchers/VouchersView.vue';
import VouchersHome from './Vouchers/VouchersHome.vue';
import ServicesTable from './HomePage/ServicesTable';
import HomeServices from './HomePage/HomeServices';


export default {
    'fv-comment': Comment,
    'fv-comments-list': CommentsList,
    'fv-typeahead': Typeahead,
    'fv-compare-typeahead': CompareTypeahead,
    'fv-promocodes': Promocodes,
    'fv-vouchers-view': VouchersView,
    'fv-vouchers-home': VouchersHome,
    'fv-services-table': ServicesTable, // deprecated
    'fv-home-services': HomeServices,
}
