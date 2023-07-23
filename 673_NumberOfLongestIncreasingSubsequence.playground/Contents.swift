import UIKit

/*
 Given an integer array nums, return the number of longest increasing subsequences.

 Notice that the sequence has to be strictly increasing.

 Input: nums = [1,3,5,4,7]
 Output: 2
 Explanation: The two longest increasing subsequences are [1, 3, 4, 7] and [1, 3, 5, 7].
 
 Input: nums = [2,2,2,2,2]
 Output: 5
 Explanation: The length of the longest increasing subsequence is 1, and there are 5 increasing subsequences of length 1, so output 5.
 */
class Solution {
    ///Time `O(n * n)`
    ///Space `O(n)`
    func findNumberOfLIS(_ nums: [Int]) -> Int {
        let n = nums.count
        guard n > 1 else { return 1 }
        
        var length = Array(repeating: 1, count: n), count = Array(repeating: 1, count: n)
        
        for i in 0..<n {
            for j in 0..<i {
                if nums[i] > nums[j] {
                    if length[j] + 1 == length[i] {
                        count[i] += count[j]
                    } else if length[j] + 1 > length[i] {
                        count[i] = count[j]
                        length[i] = length[j] + 1
                    }
                }
            }
        }
        
        let maxLength = length.max()!
        var result = 0
        
        for i in 0..<n where length[i] == maxLength {
            result += count[i]
        }
        
        return result
    }
}
