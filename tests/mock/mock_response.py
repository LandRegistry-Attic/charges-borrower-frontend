class MockJsonResponse:
    def __init__(self, value):
        self.value = value

    def json(self):
        return self.value
