from functools import wraps
from app import create_manager
from tests.mock import deed_api_mock_client


def with_context(test):
    @wraps(test)
    def _wrapped_test(self):
        with self.app.app_context():
            with self.app.test_request_context():
                test(self)

    return _wrapped_test


def with_client(test):
    @wraps(test)
    def _wrapped_test(self):
        with self.app.test_client() as client:
            test(self, client)

    return _wrapped_test


def make_mock_api_client():
    return deed_api_mock_client.DeedApiMockClient


def setUpApp(self):
    manager = create_manager(deed_api_client=make_mock_api_client())
    self.app = manager.app
    self.manager = manager
    self.app.config['TESTING'] = True
