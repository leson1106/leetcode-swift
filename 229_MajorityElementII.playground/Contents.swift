import UIKit

class Solution {
    ///Given an integer array of size n, find all elements that `appear more than ⌊ n/3 ⌋ times.`
    ///
    ///     Example 1:
    ///     Input: nums = [3,2,3]
    ///     Output: [3]
    ///     Example 2:
    ///     Input: nums = [1]
    ///     Output: [1]
    ///     Example 3:
    ///     Input: nums = [1,2]
    ///     Output: [1,2]
    ///
    ///Follow up: Could you solve the problem in linear time and in O(1) space?
    ///
    ///Time complexity `O(n + m)`, for iterating over nums and over map to convert result
    ///Space complexity `O(n)` which n is map size
    func majorityElement(_ nums: [Int]) -> [Int] {
        var condition = nums.count / 3
        var map: [Int: Int] = [:]
        for num in nums {
            map[num, default: 0] += 1
        }
        return map.compactMap { (key, value) -> Int? in
            return (value > condition) ? key : nil
        }
        /*
        var res: [Int] = []
        for (key, value) in map where value > condition {
            res.append(key)
        }
        return res
         */
    }
    
    ///Time complexity `O(2n)` -> `O(n)` overall
    ///Space complexity `O(1)`
    func majorityElement2(_ nums: [Int]) -> [Int] {
        //Condition is n/3 so there are at most 2 outputs
        var candidate1 = 0
        var count1 = 0
        var candidate2 = 0
        var count2 = 0
        for num in nums {
            if num == candidate1 {
                count1 += 1
            } else if num == candidate2 {
                count2 += 1
            } else if count1 == 0 {
                candidate1 = num
                count1 += 1
            } else if count2 == 0 {
                candidate2 = num
                count2 += 1
            } else {
                count1 -= 1
                count2 -= 1
            }
        }
        //Now candidate1 and 2 should be the 2 most frequent number
        count1 = 0
        count2 = 0
        for num in nums {
            if num == candidate1 {
                count1 += 1
            } else if num == candidate2 {
                count2 += 1
            }
        }
        let condition = nums.count / 3
        var res: [Int] = []
        if count1 > condition {
            res.append(candidate1)
        }
        if count2 > condition {
            res.append(candidate2)
        }
        return res
    }
}

let res = Solution().majorityElement2([3,2,3])
let res1 = Solution().majorityElement2([1])
let res2 = Solution().majorityElement2([1,2])
