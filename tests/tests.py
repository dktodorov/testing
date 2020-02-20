import unittest
from webapp import create_app

class TestConfig(unittest.TestCase):
    def setUp(self):
        app = create_app()
        app.config['TESTING'] = True
        app.config['WTF_CSRF_ENABLED'] = False
        app.config['DEBUG'] = False
        self.app = app.test_client()

    def test_index(self):
        response = self.app.get('/', follow_redirects=True)
        self.assertEqual(response.status_code, 200)