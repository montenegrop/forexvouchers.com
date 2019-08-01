BROKERS = 1
TRAINING = 2
VPS = 3
TRADING_SYSTEM = 4
SIGNALS = 5


class Field(object):
    def __init__(self, service, key, section, label, categories=[BROKERS, TRAINING, VPS, TRADING_SYSTEM, SIGNALS]):
        self.key = key
        self.service = service
        self.section = section
        self.label = label
        self.categories = categories

    def __str__(self):
        value = getattr(self.service, self.key)
        return str(value if value else '-')

class BooleanField(Field):
    def __str__(self):
        return 'Yes' if getattr(self.service, self.key) else 'No'

class MultiField(Field):
    def __str__(self):
        return ', '.join([value.__str__() for value in getattr(self.service, self.key).all()])


class FlagField(MultiField):
    def __str__(self):
        return ', '.join([
            f'<span class="flag flag-icon flag-icon-squared flag-icon-{ value.code.lower() } rounded-circle border border-secondary"></span>{ value.name }'
            for value in getattr(self.service, self.key).all()])


class LogoField(MultiField):
    def __str__(self):
        return ', '.join([
            f'<span class="flag flag-icon flag-icon-squared flag-icon-{ value.code.lower() } rounded-circle border border-secondary"></span>{ value.name }'
            for value in getattr(self.service, self.key).all()])


class ServiceHelper(object):
    def __init__(self, service):
        self.fields = [
            Field(service, 'founded', 'cp', 'Founded'),
            Field(service, 'status', 'cp', 'Status'),
            BooleanField(service, 'accept_us_clients', 'cp', 'Accepting US Clients', [BROKERS]),
            BooleanField(service, 'accept_eu_clients', 'cp', 'Accepting EU Clients', [BROKERS]),
            Field(service, 'broker_type', 'cp', 'Broker Type', [BROKERS]),
            Field(service, 'regulation', 'cp', 'Regulation'),
            Field(service, 'license', 'cp', 'License', [BROKERS]),

            FlagField(service, 'countries', 'cp', 'Location'),
            FlagField(service, 'international_offices', 'cp', 'International Offices', [BROKERS]),

            ##############

            Field(service, 'timezone', 'ts', 'Timezone', [BROKERS]),
            BooleanField(service, 'ea_robots', 'ts', 'EA Robots', [BROKERS]),
            BooleanField(service, 'scalping', 'ts', 'Scalping', [BROKERS]),
            BooleanField(service, 'hedging', 'ts', 'Hedging', [BROKERS]),

            MultiField(service, 'trading_software', 'ts', 'Trading Software', [BROKERS]),
            MultiField(service, 'platforms_supported', 'ts', 'Platforms Supported', [BROKERS]),

            ##############

            Field(service, 'email', 'cs', 'Email', [BROKERS, TRAINING, TRADING_SYSTEM, SIGNALS]),
            Field(service, 'phone', 'cs', 'Phone', [BROKERS, TRAINING, TRADING_SYSTEM, SIGNALS]),
            Field(service, 'office_address', 'ts', 'Office Address', [BROKERS, TRAINING, TRADING_SYSTEM, SIGNALS]),

            MultiField(service, 'chat', 'cs', 'Chat', [BROKERS, TRAINING, TRADING_SYSTEM, SIGNALS]),
            MultiField(service, 'support_languages', 'cs', 'Supported Languages', [BROKERS]),

            ##############

            Field(service, 'instructor', 'd', 'Instructor', [TRAINING]),
            Field(service, 'frequency', 'd', 'Frequency', [SIGNALS]),

            MultiField(service, 'training_courses', 'd', 'Training Courses', [TRAINING]),
            MultiField(service, 'training_type', 'd', 'Training Type', [TRAINING]),
            MultiField(service, 'methodology', 'd', 'Methodology', [TRAINING]),
            MultiField(service, 'training_tools', 'd', 'Training Tools', [TRAINING]),
            MultiField(service, 'system_type', 'd', 'System Type', [TRADING_SYSTEM]),
            MultiField(service, 'trading_type', 'd', 'Trading Type', [TRADING_SYSTEM, SIGNALS]),
            MultiField(service, 'required_software', 'd', 'Required Software', [TRADING_SYSTEM]),
            MultiField(service, 'signal_alerts', 'd', 'Signal Alerts', [SIGNALS]),
            MultiField(service, 'pricing_model', 'd', 'Pricing Model', [TRAINING, TRADING_SYSTEM, SIGNALS]),

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

    def __getattr__(self, name):
        for field in self.fields:
            if field.key == name:
                return field
