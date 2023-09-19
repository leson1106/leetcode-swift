import UIKit

class Solution {
    ///`Brute force`
    ///Time complexity `O(n^2)
    ///Space complexity `O(1)`
    func findDuplicate(_ nums: [Int]) -> Int {
        for i in 0..<nums.count {
            for j in i+1..<nums.count {
                if nums[i] == nums[j] {
                    return nums[i]
                }
            }
        }
        return -1
    }
    
    ///`Count frequencies`
    ///Time complexity `O(n)`
    ///Space complexity `O(n)`
    func findDuplicate2(_ nums: [Int]) -> Int {
        var count = Array(repeating: 0, count: nums.count)
        for i in 0..<nums.count {
            count[nums[i]] += 1
            if count[nums[i]] > 1 {
                return nums[i]
            }
        }
        return -1
    }
    
    ///`In-place marked with modifying the nums array`
    ///Time complexity `O(n)`
    ///Space complexity `O(n)`
    func findDuplicate3(_ nums: [Int]) -> Int {
        var nums = nums
        for num in nums {
            let index = abs(num)
            if nums[index] < 0 {
                return index
            }
            nums[index] = -nums[index]
        }
        return -1
    }
    
    ///`2 Pointers`
    ///Time complexity `O(n)`
    ///Space complexity `O(1)
    func findDuplicate4(_ nums: [Int]) -> Int {
        return -1
    }
}
