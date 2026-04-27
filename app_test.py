import unittest
from app import app

class TestFlask(unittest.TestCase):
    def test_home(self):
        client = app.test_client()
        response = client.get("/")

        self.assertEqual(response.status_code, 200)
        self.assertEqual(response.data.decode(), "Flask Running with pip.")

if __name__ == "__main__":
    unittest.main()