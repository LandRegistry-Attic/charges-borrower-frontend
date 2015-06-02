from tests.helpers import with_client, setUpApp, with_context
from unittest import mock, TestCase


def mocked_requests_get(*args):
    class MockResponse:
        def __init__(self, json_data, status_code):
            self.json_data = json_data
            self.status_code = status_code

        def json(self):
            return self.json_data

    return MockResponse({'address' : {}}, 200)


class TestViewDeed(TestCase):
    def setUp(self):
        setUpApp(self)

    @mock.patch('requests.get', mock.Mock(side_effect=mocked_requests_get))
    @with_context
    @with_client
    def test_view_deed_get(self, client):
        res = client.get('/deed/view')

        self.assertEqual(res.status_code, 200)
