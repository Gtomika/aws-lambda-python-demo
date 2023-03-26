import unittest
import lambda_function


class MyTestCase(unittest.TestCase):

    def test_greet(self):
        response = lambda_function.lambda_handler({
            'name': 'Tamas'
        }, None)
        self.assertEqual('Hello Tamas!', response['greet'])


if __name__ == '__main__':
    unittest.main()
