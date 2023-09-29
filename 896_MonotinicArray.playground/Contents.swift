import UIKit

class Solution {
    
    ///An array is monotonic if it is either monotone increasing or monotone decreasing.
    ///An array nums is monotone increasing if for all i <= j, nums[i] <= nums[j]. An array nums is monotone decreasing if for all i <= j, nums[i] >= nums[j].
    ///Given an integer array nums, return true if the given array is monotonic, or false otherwise.
    ///
    ///     Example 1:
    ///     Input: nums = [1,2,2,3]
    ///     Output: true
    ///
    ///     Example 2:
    ///     Input: nums = [6,5,4,4]
    ///     Output: true
    ///
    ///     Example 3:
    ///     Input: nums = [1,3,2]
    ///     Output: false
    ///
    ///Time complexity `O(n)`
    ///Space complexity `O(1)`
    func isMonotonic(_ nums: [Int]) -> Bool {
        guard nums.count > 1 else { return true }
        var isIncrease: Bool = false
        if let first = nums.first, let last = nums.last {
            isIncrease = first <= last
        }
        
        var slow: Int = 0
        var fast: Int = 1
        
        while fast < nums.count {
            let isValid: Bool = isIncrease ?
            nums[slow] <= nums[fast] :
            nums[slow] >= nums[fast]
            if !isValid {
                return false
            }
            slow += 1
            fast += 1
        }
        return true
    }
}
