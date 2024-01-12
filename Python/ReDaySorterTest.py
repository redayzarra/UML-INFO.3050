import unittest
from unittest.mock import patch
from io import StringIO
from ReDaySorter import SimpleSorter


class TestSimpleSorter(unittest.TestCase):

    # Normal test input - everything should be fine
    @patch('sys.argv', ['mySorter.py', 'spencer', 'able', 'delta'])
    @patch('sys.stdout', new_callable=StringIO)
    def test_sort_ascending(self, mock_stdout):
        sorter = SimpleSorter()
        sorter.handler() 
        self.assertEqual(mock_stdout.getvalue().strip(), 'able delta spencer')

    # Reverse the test input using -r
    @patch('sys.argv', ['mySorter.py', '-r', 'spencer', 'able', 'delta'])
    @patch('sys.stdout', new_callable=StringIO)
    def test_sort_descending(self, mock_stdout):
        sorter = SimpleSorter()
        sorter.handler() 
        self.assertEqual(mock_stdout.getvalue().strip(), 'spencer delta able')

    # Invalid test input because we have --foo which is invalid
    @patch('sys.argv', ['mySorter.py', '--foo', 'spencer', 'able', 'delta'])
    @patch('sys.stdout', new_callable=StringIO)
    def test_invalid_switch(self, mock_stdout):
        sorter = SimpleSorter()
        sorter.handler() 
        self.assertIn("Invalid switch --foo", mock_stdout.getvalue().strip())

    # No input provided - can be optimized further (return asap)
    @patch('sys.argv', ['mySorter.py'])
    @patch('sys.stdout', new_callable=StringIO)
    def test_no_words(self, mock_stdout):
        sorter = SimpleSorter()
        sorter.handler() 
        self.assertIn("Invalid command line arguments to program", mock_stdout.getvalue().strip())

if __name__ == '__main__':
    unittest.main(argv=[''], exit=False)
