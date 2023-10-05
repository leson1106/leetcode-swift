import UIKit

class Solution {
    ///Given an array nums of size n, return the majority element.
    ///The majority element is the element that `appears more than ⌊n / 2⌋ times`. You may assume that the majority element always exists in the array.
    ///
    ///     Example 1:
    ///     Input: nums = [3,2,3]
    ///     Output: 3
    ///     Example 2:
    ///     Input: nums = [2,2,1,1,1,2,2]
    ///     Output: 2
    ///
    ///`Boyer-Moore Algorithm`
    ///Time complexity `O(n)`
    ///Space complexity `O(1)`
    func majorityElement(_ nums: [Int]) -> Int {
        var candidate: Int = 0
        var count: Int = 0
        for num in nums {
            if count == 0 { candidate = num }
            count += (candidate == num) ? 1 : -1
        }
        return candidate
    }
}

let res = Solution().majorityElement([2,2,1,1,1,2,2])
//loop1: res = 2, count = 1
//loop2: res = 2, count = 2
//loop3: res = 2, count = 1
//loop4: res = 2, count = 0
//loop5: res = 1, count = 1
//loop6: res = 1, count = 0
//loop7: res = 2, count = 1 -> return 2
