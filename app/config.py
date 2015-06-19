import os

DEBUG = True
DEED_API_BASE_HOST = os.getenv('DEED_API_ADDRESS', 'http://localhost:5050')
# DEED_CLIENT = "app.service.deed_api_client.DeedApiClient"
DEED_CLIENT = 'tests.mock.deed_api_mock_client.DeedApiMockClient'
