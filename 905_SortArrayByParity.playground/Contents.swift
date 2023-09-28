import UIKit

///Using pointer
class Solution {
    ///Given an integer array nums, move all the even integers at the beginning of the array followed by all the odd integers.
    ///Return any array that satisfies this condition.
    ///
    ///     Input: nums = [3,1,2,4]
    ///     Output: [2,4,3,1]
    ///     Explanation: The outputs [4,2,3,1], [2,4,1,3], and [4,2,1,3] would also ///be accepted.
    ///
    ///Time complexity `O(n)`
    ///Space complexity `O(1)`
    func sortArrayByParity(_ nums: [Int]) -> [Int] {
        var w: Int = 0
        
        var nums = nums
        
        for r in 0..<nums.count {
            if nums[r] % 2 == 0 {
                let target = nums[r]
                let source = nums[w]
                nums[r] = source
                nums[w] = target
                w += 1
            }
        }
        
        return nums
    }
}

let res = Solution().sortArrayByParity([3,1,2,4])
