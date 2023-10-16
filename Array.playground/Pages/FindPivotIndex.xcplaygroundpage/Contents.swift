//: [Previous](@previous)

import Foundation

class Solution {
    func pivotIndex(_ nums: [Int]) -> Int {
        var sum = 0
        for each in nums {
            sum += each
        }
        
        var pivot: Int = -1
        var left: Int = 0
        for i in 0..<nums.count {
            sum -= nums[i]
            if left == sum {
                pivot = i
                break
            }
            left += nums[i]
        }
        
        return pivot
    }
}

let res = Solution().pivotIndex([1,7,3,6,5,6])
let res1 = Solution().pivotIndex([1,2,3])
let res2 = Solution().pivotIndex([2,1,-1])
//: [Next](@next)
