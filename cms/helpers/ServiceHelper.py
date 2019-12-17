from django.db import models

BROKERS = 1
TRAINING = 2
VPS = 3
TRADING_SYSTEM = 4
SIGNALS = 5
TOOLS = 6


class Field(object):
    def __init__(self, service, key, section, label,
                 categories=[BROKERS, TRAINING, VPS, TRADING_SYSTEM, SIGNALS, TOOLS]):
        self.key = key
        self.service = service
        self.section = section
        self.label = label
        self.categories = categories

    def __str__(self):
        value = getattr(self.service, self.key)
        return str(value if value else '-')

    def to_csv(self):
        value = self.__str__()
        return value if value != '-' else ''

    def to_dict(self):
        value = getattr(self.service, self.key)
        if hasattr(value, 'to_dict'):
            return value.to_dict()
        elif None == value:
            return value
        else:
            return value.__str__()


class BooleanField(Field):
    def __str__(self):
        return 'Yes' if getattr(self.service, self.key) else 'No'

    def to_dict(self):
        return True if getattr(self.service, self.key) else False


class MultiField(Field):
    def get_all_values(self):
        value = getattr(self.service, self.key)
        if value is None:
            raise Exception(self.key + " is None")
        return value.all()

    def to_csv(self):
        return ','.join(
            [value.slug if hasattr(value, 'slug') else value.name for value in getattr(self.service, self.key).all()])

    def __str__(self):
        return ', '.join([value.__str__() for value in self.get_all_values()])

    def to_dict(self):
        elements = []
        for value in getattr(self.service, self.key).all():
            if hasattr(value, 'to_dict'):
                elements.append(value.to_dict())
            elif hasattr(value, 'slug'):
                elements.append(value.slug)
            elif hasattr(value, 'name'):
                elements.append(value.name)
            elif hasattr(value, 'description'):
                elements.append(value.description)

        return elements


class FlagField(MultiField):
    def __str__(self):
        return ', '.join([
            f'<span class="flag flag-icon flag-icon-squared flag-icon-{ value.code.lower() } rounded-circle border border-secondary"></span>{ value.name }'
            for value in self.get_all_values()])

    def to_csv(self):
        return ','.join([value.code for value in getattr(self.service, self.key).all()])


class LogoField(MultiField):
    def __str__(self):
        return ', '.join([
            f'<span class="flag flag-icon flag-icon-squared flag-icon-{ value.code.lower() } rounded-circle border border-secondary"></span>{ value.name }'
            for value in self.get_all_values()])


class ServiceHelper(object):
    def __init__(self, service):
        self.fields = [

            # common fields for all:
            Field(service, 'founded', 'cp', 'Founded'),
            Field(service, 'regulation', 'cp', 'Regulation'),
            Field(service, 'license', 'cp', 'License'),
            FlagField(service, 'location', 'cp', 'Location'),
            # #
            Field(service, 'email', 'cs', 'Email'),
            Field(service, 'phone', 'cs', 'Phone'),
            MultiField(service, 'chat', 'cs', 'Chat'),
            Field(service, 'office_address', 'ts', 'Office Address'),
            # #
            Field(service, 'about', 'a', 'About'), #
            # only for services:
            Field(service, 'name', 'cp', 'Name'),
            MultiField(service, 'trading_type', 'd', 'Trading Type', [TRAINING, TRADING_SYSTEM, SIGNALS, VPS, TOOLS]),
            MultiField(service, 'trading_software', 'd', 'Trading Software',
                       [TRAINING, TRADING_SYSTEM, SIGNALS, VPS, TOOLS]),  #
            MultiField(service, 'system_type', 'd', 'System Type', [TRAINING, TRADING_SYSTEM, SIGNALS, VPS, TOOLS]),
            MultiField(service, 'trading_tools', 'd', 'Trading Tools', [TRAINING, TRADING_SYSTEM, SIGNALS, VPS, TOOLS]),
            #
            MultiField(service, 'pricing_model', 'd', 'Pricing Model', [TRAINING, TRADING_SYSTEM, SIGNALS, VPS, TOOLS]),
            # only for brokers:
            FlagField(service, 'international_offices', 'cp', 'International offices', [BROKERS]),
            FlagField(service, 'restrictions', 'cp', 'Restrictions', [BROKERS]),  #
            # #
            MultiField(service, 'account_types', 'ta', 'Account Types', [BROKERS]),
            MultiField(service, 'trading_instruments', 'ta', 'Trading Instruments', [BROKERS]),
            MultiField(service, 'revenue_model', 'ta', 'Revenue Model', [BROKERS]),
            MultiField(service, 'account_options', 'ta', 'Account Options', [BROKERS]),
            MultiField(service, 'account_currency', 'ta', 'Account Currency', [BROKERS]),
            MultiField(service, 'deposit_method', 'ta', 'Deposit Method', [BROKERS]),  #
            MultiField(service, 'withdraw_method', 'ta', 'Withdraw Method', [BROKERS]),  #
            Field(service, 'minimum_deposit', 'ta', 'Minimum deposit ($)', [BROKERS]),
            Field(service, 'commission', 'ta', 'Commission ($)', [BROKERS]),
            Field(service, 'leverage', 'ta', 'Leverage', [BROKERS]),
            Field(service, 'spread', 'ta', 'Spread', [BROKERS]),
            Field(service, 'min_lot_size', 'ta', 'Min lot size', [BROKERS]),  #
            MultiField(service, 'security_of_funds', 'ta', 'Security of Funds', [BROKERS]),  #
            # #
            Field(service, 'timezone', 'ts', 'Timezone', [BROKERS]),
            MultiField(service, 'trading_software', 'ts', 'Trading Software', [BROKERS]),
            MultiField(service, 'operating_system', 'ts', 'Operating System', [BROKERS]),  #
            BooleanField(service, 'ea_robots', 'ts', 'EA Robots', [BROKERS]),
            BooleanField(service, 'scalping', 'ts', 'Scalping', [BROKERS]),
            BooleanField(service, 'hedging', 'ts', 'Hedging', [BROKERS]),
            BooleanField(service, 'news_trading', 'ts', 'News Trading', [BROKERS]),  #
            # #
            MultiField(service, 'support_languages', 'cs', 'Supported Languages', [BROKERS]),

        ]

        self.service = service

    def company_profile(self):
        for field in self.fields:
            if field.section == 'cp' and self.service.category.id in field.categories:
                yield field

    def trading_setup(self):
        for field in self.fields:
            if field.section == 'ts' and self.service.category.id in field.categories:
                yield field

    def customer_support(self):
        for field in self.fields:
            if field.section == 'cs' and self.service.category.id in field.categories:
                yield field

    def details(self):
        for field in self.fields:
            if field.section == 'd' and self.service.category.id in field.categories:
                yield field

    def about(self):
        for field in self.fields:
            if field.section == 'a' and self.service.category.id in field.categories:
                yield field

    def __getattr__(self, name):
        for field in self.fields:
            if field.key == name:
                return field

    def get_csv_value(self, name):
        for field in self.fields:
            if field.key == name:
                return field.to_csv()

        value = getattr(self.service, name)
        return value.slug if isinstance(value, models.Model) else str(value)

    def to_dict(self):
        obj = {}
        for field in self.fields:
            if self.service.category_id in field.categories:
                obj[field.key] = field.to_dict()
                obj['logo_url'] = self.service.logo.get_rendition('width-100').url if self.service.logo else None
                obj['url'] = '/services/' + self.service.slug
                obj['avg_rate'] = self.service.get_avg_rate
                obj['count_rate'] = self.service.get_count_rate
                obj['slug'] = self.service.slug
        return obj
