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
        return str(getattr(self.service, self.key))


class ServiceHelper(object):
    def __init__(self, service):
        self.fields = [
            Field(service, 'founded', 'cp', 'Founded')
        ]

        self.service = service

    def company_profile(self):
        return [['founded', 'status']]

    def founded(self):
        for field in self.fields:
            if field.key == 'founded':
                return field




