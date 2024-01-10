import unittest
from MergeSort import ReDaySorter

# Testing the mergeSort function from ReDaySorter using unit tests
class TestMergeSort(unittest.TestCase):
    def setUp(self):
        self.sorter = ReDaySorter()

	# No input
    def test_empty_array(self):
        self.assertEqual(self.sorter.sortArray([]), [])

	# Easy optimization can be made, but the code should take care of it
    def test_single_element(self):
        self.assertEqual(self.sorter.sortArray([1]), [1])

	# Pretty straight forward, the code just has to do nothing
    def test_sorted_array(self):
        self.assertEqual(self.sorter.sortArray([1, 2, 3, 4]), [1, 2, 3, 4])

	# This should be pretty intense to see behind the scenes
    def test_reverse_sorted(self):
        self.assertEqual(self.sorter.sortArray([4, 3, 2, 1]), [1, 2, 3, 4])

	# The more normal case for how mergeSort would be used
    def test_random_order(self):
        self.assertEqual(self.sorter.sortArray([3, 1, 4, 2]), [1, 2, 3, 4])

	# Maybe a future version could have an option to remove duplicates
    def test_duplicates(self):
        self.assertEqual(self.sorter.sortArray([1, 3, 2, 3, 1]), [1, 1, 2, 3, 3])

	# Larger integer values is not a problem, length of input is
    def test_large_numbers(self):
        self.assertEqual(self.sorter.sortArray([1000, 500, 1500]), [500, 1000, 1500])

	# Should be the same as random numbers
    def test_negative_numbers(self):
        self.assertEqual(self.sorter.sortArray([-2, -3, -1]), [-3, -2, -1])

# Run the test from the command line
if __name__ == '__main__':
    unittest.main()
