import UIKit

class Solution {
    ///Given an array of integers nums sorted in non-decreasing order, find the starting and ending position of a given target value.
    ///If target is not found in the array, return [-1, -1].
    ///You must write an algorithm with O(log n) runtime complexity.
    ///
    ///     Example 1:
    ///     Input: nums = [5,7,7,8,8,10], target = 8
    ///     Output: [3,4]
    ///     Example 2:
    ///     Input: nums = [5,7,7,8,8,10], target = 6
    ///     Output: [-1,-1]
    ///     Example 3:
    ///     Input: nums = [], target = 0
    ///     Output: [-1,-1]
    ///
    ///Time complexity `O(log n)`
    ///Space complexity `O(1)`
    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        guard !nums.isEmpty else { return [-1, -1] }
        guard nums.count > 1 else {
            if let first = nums.first, first == target {
                return [0, 0]
            } else {
                return [-1, -1]
            }
        }
        var left = 0
        var right = nums.count - 1
        var res: [Int] = [-1, -1]
        while left <= right {
            let mid = left + (right - left) / 2
            
            if nums[mid] == target {
                var firstIndex = -1
                var lastIndex = -1
            findFirstIndex: for i in stride(from: mid, through: 0, by: -1) {
                if nums[i] == target {
                    firstIndex = i
                } else {
                    break findFirstIndex
                }
            }
            findLastIndex: for i in mid..<nums.count {
                if nums[i] == target {
                    lastIndex = i
                }  else {
                    break findLastIndex
                }
            }
                res[0] = firstIndex
                res[1] = lastIndex
                break
            }
            
            if nums[mid] > target {
                right = mid - 1
            } else {
                left = mid + 1
            }
        }
        return res
    }
}

let res = Solution().searchRange([5,7,7,8,8,10], 8)
let res1 = Solution().searchRange([5,7,7,8,8,10], 6)
let res2 = Solution().searchRange([], 0)
let res3 = Solution().searchRange([1], 0)
let res4 = Solution().searchRange([1], 1)
let res5 = Solution().searchRange([1,4], 4)
let res6 = Solution().searchRange([2,2], 2)
