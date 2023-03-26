import unittest
import lambda_function


class Test(unittest.TestCase):

    def test_sum(self):
        response = lambda_function.lambda_handler({
            'num1': 5,
            'num2': 7
        }, None)
        self.assertEqual(12, response['result'])


if __name__ == '__main__':
    unittest.main()
