import UIKit

class Solution {
    /// Examples:
    ///
    ///
    ///     Example 1:
    ///     Input: nums = [3,0,1]
    ///     Output: 2
    ///     Explanation: n = 3 since there are 3 numbers, so all numbers are in the range [0,3]. 2 is the missing number in the range since it does not appear in nums.
    ///
    ///     Example 2:
    ///     Input: nums = [0,1]
    ///     Output: 2
    ///     Explanation: n = 2 since there are 2 numbers, so all numbers are in the range [0,2]. 2 is the missing number in the range since it does not appear in nums.
    ///
    ///     Example 3:
    ///     Input: nums = [9,6,4,2,3,5,7,0,1]
    ///     Output: 8
    ///     Explanation: n = 9 since there are 9 numbers, so all numbers are in the range [0,9]. 8 is the missing number in the range since it does not appear in nums.
    ///
    ///
    /// Sort approach, Time complexity O(n log n), Space complexity O(1)
    func missingNumber(_ nums: [Int]) -> Int {
        var nums = nums.sorted()
        var maxV = nums.count
        var curr = -1
        var res = -1
        for i in 0..<nums.count {
            if curr == nums[i]-1 {
                curr = nums[i]
            } else {
                res = nums[i] - 1
                break
            }
        }
        if res == -1 {
            res = maxV
        }
        return res
    }

    /// Sum fomular, Time complexity O(n), Space complexity O(1)
    func missingNumber2(_ nums: [Int]) -> Int {
        let n = nums.count
        var total = n * (n + 1) / 2
        for num in nums {
            total -= num
        }
        return total
    }
}
