class Solution(object):
    def isPalindrome(self, x):
        """
        :type x: int
        :rtype: bool
        """
        if x < 0:
                return False
        
        # 1. SAVE THE ORIGINAL VALUE
        original_x = x 
        sum = 0
        
        while x > 0:
            digit = x % 10
            sum = (sum * 10) + digit
            x = x // 10

        # 2. COMPARE SUM TO THE SAVED ORIGINAL
        return sum == original_x