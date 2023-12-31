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
    
    ///Given two integer arrays nums1 and nums2, return an array of their intersection.
    ///Each element in the result must be unique and you may return the result in any order.
    ///
    ///     E.g: Input: nums1 = [1,2,2,1], nums2 = [2,2]
    ///     Output: [2]
    ///
    ///     E.g: Input: nums1 = [4,9,5], nums2 = [9,4,9,8,4]
    ///     Output: [9,4] | [4,9]
    ///
    ///Time complexity: linear time`O(n * m)` which n is length of nums1 & nums2
    ///Space complexity: `O(n + m)` in worse case when all array's elements are different
    func intersection(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        let set1 = Set(nums1)
        let set2 = Set(nums2)
        
        func iterate(_ biggerSet: Set<Int>, _ smallerSet: Set<Int>) -> [Int] {
            var result: [Int] = []
            for num in biggerSet {
                if smallerSet.contains(num) {
                    result.append(num)
                }
            }
            return result
        }
        
        if set1.count > set2.count {
            return iterate(set1, set2)
        } else {
            return iterate(set2, set1)
        }
    }
    
    ///Write an algorithm to determine if a number n is happy.
    ///A happy number is a number defined by the following process:
    ///Starting with any positive integer, replace the number by the sum of the squares of its digits.
    ///Repeat the process until the number equals 1 (where it will stay), or it loops endlessly in a cycle which does not include 1.
    ///Those numbers for which this process ends in 1 are happy.
    ///Return true if n is a happy number, and false if not.
    ///
    ///     E.g: Input: n = 19
    ///     Output: true
    ///     Explanation:
    ///     12 + 92 = 82
    ///     82 + 22 = 68
    ///     62 + 82 = 100
    ///     12 + 02 + 02 = 1
    ///
    ///Time complexity: linear time`O(log n)`cause spliting number to smaller instead iterate from 0 to n
    ///Space complexity: `O(n)` which n is seen's elements
    func isHappy(_ n: Int) -> Bool {
        func split(_ input: Int) -> Int {
            var sum = 0
            var input = input
            
            while input > 0 {
                let remainder = input % 10
                sum += (remainder * remainder)
                input = input / 10
            }
            
            return sum
        }
        
        var seen: Set<Int> = .init()
        var input = n
        
        while input != 1 {
            if seen.contains(input) {
                return false
            }
            seen.insert(input)
            input = split(input)
        }
        
        return true
    }
}

//let result1 = Solution().containsDuplicate([1,2,3,1])
//let result2 = Solution().singleNumber([1,1,2])
//let result3 = Solution().intersection([4,9,5], [9,4,9,8,4])
let result4 = Solution().isHappy(7)
