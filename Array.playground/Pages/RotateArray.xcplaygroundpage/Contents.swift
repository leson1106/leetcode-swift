//: [Previous](@previous)

import Foundation

class Solution {
    ///Time complexity `O(n * k)` which n is array size
    ///Space complexity `O(1)`
    func rotate(_ nums: inout [Int], _ k: Int) {
        var swapped = 0
        
        while swapped < k {
            let last = nums.removeLast() //O(1)
            nums.insert(last, at: 0) //O(n)
            swapped += 1
        }
    }
    
    ///Optimal
    ///Time complexity `O(n)`
    ///Space complexity `O(1)`
    func rotate2(_ nums: inout [Int], _ k: Int) {
        let length = nums.count - 1
        let k = k % nums.count
        reverse(&nums, length, 0)
        reverse(&nums, k-1, 0)
        reverse(&nums, length, k)
    }
    
    private func reverse(_ nums: inout [Int], _ from: Int, _ to: Int) {
        var left = to
        var right = from
        while left < right {
            nums.swapAt(left, right)
            left += 1
            right -= 1
        }
    }
}
var input = [1,2,3,4,5,6,7]
var input1 = [-1]
var input2 = [1,2,3]
Solution().rotate2(&input, 3)
Solution().rotate2(&input1, 2)
Solution().rotate2(&input2, 4)

//: [Next](@next)
