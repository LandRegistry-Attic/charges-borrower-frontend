from tests.helpers import with_client, setUpApp, with_context
import unittest


class TestSignDeedSuccess(unittest.TestCase):
    def setUp(self):
        setUpApp(self)

    @with_context
    @with_client
    def test_sign_deed_post(self, client):
        res = client.post('/deed/sign', data={"borrowerName": "John Smith"})

        self.assertEqual(res.status_code, 303)

    @with_context
    @with_client
    def test_sign_deed_get(self, client):
        res = client.get('/deed/sign/confirmation')

        self.assertEqual(res.status_code, 200)
