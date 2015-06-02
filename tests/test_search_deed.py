from tests.helpers import with_client, setUpApp, with_context
import unittest


class TestSearchDeed(unittest.TestCase):
    def setUp(self):
        setUpApp(self)

    @with_context
    @with_client
    def test_search_deed_post(self, client):
        res = client.post('/deed/search', data={'deedRefNumber': '38'})

        self.assertEqual(res.status_code, 303)

    @with_context
    @with_client
    def test_search_deed_get(self, client):
        res = client.get('/deed/search')

        self.assertEqual(res.status_code, 200)
