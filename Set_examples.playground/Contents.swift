import UIKit

class Solution {
    ///Given an integer array nums, return true if any value appears at least twice in the array, and return false if every element is distinct.
    ///
    ///     E.g: Input: nums = [1,2,3,1]
    ///     Output: true
    ///
    ///     E.g: Input: nums = [1,2,3,4]
    ///     Output: false
    ///
    ///     E.g: Input: nums = [1,1,1,3,3,4,3,2,4,2]
    ///     Output: true
    ///
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
    
    ///Given a non-empty array of integers nums, every element appears twice except for one. Find that single one.
    ///You must implement a solution with a linear runtime complexity and use only constant extra space.
    ///
    ///     E.g: Input: nums = [2,2,1]
    ///     Output: 1
    ///
    ///     E.g: Input: nums = [4,1,2,1,2]
    ///     Output: 4
    ///
    ///     E.g: Input: nums = [1]
    ///     Output: 1
    ///
    ///Time complexity: linear time`O(n)` which n is array elements
    ///Space complexity: `O(1)`
    func singleNumber(_ nums: [Int]) -> Int {
        nums.reduce(into: 0, ^=)
    }
}

let result1 = Solution().containsDuplicate([1,2,3,1])
let result2 = Solution().singleNumber([1,1,2])
