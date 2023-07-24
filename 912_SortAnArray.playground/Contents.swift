import UIKit

/*
 Given an array of integers nums, sort the array in ascending order and return it.

 You must solve the problem without using any built-in functions in O(nlog(n)) time complexity and with the smallest space complexity possible.
 
 Input: nums = [5,2,3,1]
 Output: [1,2,3,5]
 Explanation: After sorting the array, the positions of some numbers are not changed (for example, 2 and 3), while the positions of other numbers are changed (for example, 1 and 5).
 
 Input: nums = [5,1,1,2,0,0]
 Output: [0,0,1,1,2,5]
 Explanation: Note that the values of nums are not necessairly unique.
 */
class Solution {
    ///Counting sort
    ///Time `O(n+k)`which `n` is nums length and `k` is range between min & max
    ///Space `O(n)` which  `n` is total value of `map` in worst case
    func sortArray(_ nums: [Int]) -> [Int] {
        guard !nums.isEmpty else { return [] }
        var nums = nums
        var map: [Int: Int] = [:]
        var minVal = nums[0]
        var maxVal = nums[0]
        
        for i in 0..<nums.count {
            minVal = min(nums[i], minVal)
            maxVal = max(nums[i], maxVal)
            map[nums[i], default: 0] += 1
        }
        
        var i = 0
        while minVal <= maxVal {
            for (key, value) in map {
                if key == minVal && value > 0 {
                    nums[i] = key
                    i += 1
                    if map[key] != nil {
                        map[key]! -= 1
                    }
                }
            }
            minVal += 1
        }
        
        return nums
    }
}

let array = [5,2,3,1]
let result = Solution().sortArray(array)
