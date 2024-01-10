from typing import List

class ReDaySorter:
    
    """
    There are many types of sorting algorithms. My favorite is a 
    recurisve version of merge sort since the time complexity is 
    fairly resonable and the algorithm is stable (elements maintain
    their order). The recursive implementation is very nice to look at.
    """
    
    def sortArray(self, nums: List[int]) -> List[int]:

		# The merge helper function simply merges two arrays 
        def merge(left: List[int], right: List[int]):
            res = []
            i = j = 0

            while i < len(left) and j < len(right): 
                if left[i] <= right[j]:
                    res.append(left[i])
                    i += 1
                else:
                    res.append(right[j])
                    j += 1

            res.extend(left[i:])
            res.extend(right[j:])

            return res
		
		# The mergeSort helper function simply calls the merge on mid
        def mergeSort(arr: List[int]) -> List[int]:
            if len(arr) == 1:
                return arr

            mid = len(arr) // 2
            left = mergeSort(arr[:mid])
            right = mergeSort(arr[mid:])

            return merge(left, right)
        
        # Call mergeSort on the input nums and watch it unravel itself
        return mergeSort(nums)
