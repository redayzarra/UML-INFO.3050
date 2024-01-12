import sys

class SimpleSorter:
    
    def sort_words(self, words: list[str], reverse: bool = False) -> list[str]:
        """
        Sorts a list of words in ascending or descending order using
        the built-in sort function in Python. No manual implementations 
        today :(
        """
        
        # Time Complexity: Sorting is O(n log(n))
        # Space Complexity: Including the words (n) array it is O(n)
        return sorted(words, reverse=reverse)

    def handler(self):
        """
        Handle command line arguments and print sorted words.
        """
        # Check for at least one argument
        if len(sys.argv) < 2:
            print("Invalid command line arguments to program. Please supply two or more strings to sort.")
            return

        # Initialize the switches array (to store valid switches), reverse bool, and the final filtered words from input
        valid_switches = ['-r', '--reverse']
        reverse = False
        words = []

        # Collected words, check if we need to reverse, and ensure switches are valid
        for arg in sys.argv[1:]:
            if arg in valid_switches:
                reverse = True
            elif arg.startswith('-'):
                print(f"Invalid switch {arg}. Use -r or --reverse for reverse sorting.")
                return
            else:
                words.append(arg)

        # Check if words are provided
        if not words:
            print("Invalid command line arguments to program. Please supply two or more strings to sort.")
            return

        # Sort and print the words
        sorted_words = self.sort_words(words, reverse)
        
        # Time Complexity: O(n) for words (n) - not including sorting
        # Space Complexity: O(n)
        print(' '.join(sorted_words))
