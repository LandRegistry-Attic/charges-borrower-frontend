import os

DEBUG = True
DEED_API_BASE_HOST = os.getenv('DEED_API_ADDRESS', 'http://10.10.10.10:5000')
SCRIBE_API_BASE_HOST = os.getenv('SCRIBE_API_ADDRESS', 'http://localhost:6000')
