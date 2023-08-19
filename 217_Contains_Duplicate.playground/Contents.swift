import UIKit

class Solution {
    
    ///Time complexity  `O(n)` which n is array elements
    ///Space complexity `O(n)` which n is set elements
    func containsDuplicate(_ nums: [Int]) -> Bool {
        var set: Set<Int> = .init()
        
        for num in nums {
            if set.contains(num) {
                return true
            }
            set.insert(num)
        }
        
        return false
    }
}

let result = Solution().containsDuplicate([1,2,3,1])
