var BROKERS = '1';
var TRAINING = '2';
var VPS = '3';
var TRADING_SYSTEM = '4';
var SIGNALS = '5';


const fields = {
    "broker name": [BROKERS],
    "broker_type": [BROKERS],
    "international_offices": [BROKERS],
    "accept_us_clients": [BROKERS],
    "accept_eu_clients": [BROKERS],
    "timezone": [BROKERS],
    "trading_software": [BROKERS],
    "platforms_supported": [BROKERS],
    "ea_robots": [BROKERS],
    "scalping": [BROKERS],
    "hedging": [BROKERS],
    "email": [BROKERS, TRAINING, TRADING_SYSTEM, SIGNALS],
    "phone": [BROKERS, TRAINING, TRADING_SYSTEM, SIGNALS],
    "chat": [BROKERS, TRAINING, TRADING_SYSTEM, SIGNALS],
    "support_languages": [BROKERS],
    "office_address": [BROKERS, TRAINING, TRADING_SYSTEM, SIGNALS],
    "training_courses": [TRAINING],
    "training_type": [TRAINING],
    "methodology": [TRAINING],
    "training_tools": [TRAINING],
    "instructor": [TRAINING],
    "pricing_model": [TRAINING, TRADING_SYSTEM, SIGNALS],
    "system_type": [TRADING_SYSTEM],
    "trading_type": [TRADING_SYSTEM, SIGNALS],
    "required_software": [TRADING_SYSTEM],
    "signal_alerts": [SIGNALS],
    "frequency": [SIGNALS],
    "account_types": [BROKERS],
    "trading_instruments": [BROKERS],
    "revenue_model": [BROKERS],
    "account_options": [BROKERS],
    "account_currency": [BROKERS],
    "payment_method": [BROKERS],
    "minimum_deposit": [BROKERS],
    "commission": [BROKERS],
    "leverage": [BROKERS],
    "spread": [BROKERS],
    "swap_free": [BROKERS],
    "islamic_accounts": [BROKERS],
    "bonus_policy": [BROKERS],


}

var headers = {
    'Trading Account': [BROKERS],
    'Details': [TRAINING, TRADING_SYSTEM, SIGNALS],
    'Trading setup': [BROKERS],
    'Customer Support': [BROKERS, TRAINING, TRADING_SYSTEM, SIGNALS]
}

function service_fields(id) {
    var showFields = Object.keys(fields).filter(function (key) {
        return fields[key].indexOf(id) !== -1
    });
    var hideFields = Object.keys(fields).filter(function (key) {
        return fields[key].indexOf(id) === -1
    });

    showFields.forEach(function (key) {
        $('#id_' + key).closest('.li').show()
    });
    hideFields.forEach(function (key) {
        $('#id_' + key).closest('.li').hide()
    });

    $.each($('h2 label'), function () {
        var $h = $(this);
        var text = $h.html().trim();
        if (Object.keys(headers).indexOf(text) === -1) return;

        headers[text].indexOf(id) !== -1 ? $h.closest('li.multi-field').show() : $h.closest('li.multi-field').hide();
    });
}


var url = window.location.href;

if (url.indexOf('/cms/service/create/') != -1 || url.indexOf('/cms/service/edit/') != -1) {
    // service edit
    window.onload = function () {
        $category = $('#id_category');
        service_fields($category.val())
        $category.bind('change', function () {
            service_fields($category.val())
        })
    }
}

// polyfill
if (!String.prototype.trim) {
    (function () {
        // Make sure we trim BOM and NBSP
        var rtrim = /^[\s\uFEFF\xA0]+|[\s\uFEFF\xA0]+$/g;
        String.prototype.trim = function () {
            return this.replace(rtrim, '');
        };
    })();
}