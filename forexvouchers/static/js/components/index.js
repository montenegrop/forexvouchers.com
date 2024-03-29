import Comment from './Comments/Comment.vue';
import CommentsList from './Comments/CommentsList.vue';
import Typeahead from './Typeahead/Typeahead.vue';
import CompareTypeahead from './Typeahead/CompareTypeahead.vue';
import Promocodes from './PeelReveal/Promocodes.vue';
import VouchersView from './Vouchers/VouchersView.vue';
import VouchersHome from './Vouchers/VouchersHome.vue';
import HomeSearch from "./HomePage/HomeSearch";
import HomeServices from './HomePage/HomeServices';
import HomeVouchers from "./HomePage/HomeVouchers";
import ServicesFilterView from './ServiceFilter/View';
import discount from "./Vouchers/Middleware/discount";
import promocode from "./Vouchers/Middleware/promocode";
import offer from "./Vouchers/Middleware/offer";
import VoucherDiscountSmall from "./Cards/VoucherSmall/VoucherDiscountSmall";
import VoucherPromocodeSmall from "./Cards/VoucherSmall/VoucherPromocodeSmall";
import VoucherOfferSmall from "./Cards/VoucherSmall/VoucherOfferSmall";
import PremiumPartners from "./HomePage/PremiumPartners";
import NewsFeeds from "./HomePage/NewsFeeds";
import Subscribe from "./Subscribe/index";
import ScrollerDown from "./ScrollerDown";
import ScrollerUp from "./ScrollerUp";

export default {
    'fv-comment': Comment,
    'fv-comments-list': CommentsList,
    'fv-typeahead': Typeahead,
    'fv-compare-typeahead': CompareTypeahead,
    'fv-promocodes': Promocodes,
    'fv-vouchers-view': VouchersView,
    'fv-vouchers-home': VouchersHome,
    'fv-home-search': HomeSearch,
    'fv-home-services': HomeServices,
    'fv-home-vouchers': HomeVouchers,
    'fv-services-filter-view': ServicesFilterView,
    'fv-middleware-discount': discount,
    'fv-middleware-promocode': promocode,
    'fv-middleware-offer': offer,
    'fv-vouchers-discount-small': VoucherDiscountSmall,
    'fv-vouchers-promocode-small': VoucherPromocodeSmall,
    'fv-vouchers-offer-small': VoucherOfferSmall,
    'fv-premium-partners': PremiumPartners,
    'fv-news-feeds': NewsFeeds,
    'fv-subscribe': Subscribe,
    'fv-scroller-down': ScrollerDown,
    'fv-scroller-up': ScrollerUp,
}
