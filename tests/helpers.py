from functools import wraps
from app import create_manager
from tests.mock import mock_clients


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


def mock_deed_api_client():
    return mock_clients.DeedApiMockClient


def mock_scribe_api_client():
    return mock_clients.ScribeApiMockClient


def setUpApp(self):
    manager = create_manager(deed_api_client=mock_deed_api_client(),
                             scribe_api_client=mock_scribe_api_client())
    self.app = manager.app
    self.manager = manager
    self.app.config['TESTING'] = True
