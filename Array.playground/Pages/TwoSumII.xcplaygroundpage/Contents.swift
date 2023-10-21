//: [Previous](@previous)

import Foundation

class Solution {
    ///Time complexity:
    ///     There are (n - 1) + (n - 2) + ... + 1 pairs
    ///     => group (n-1 + 1) + (n - 2 + 2) + ...
    ///     => we will have (n - 1) / 2 pairs then multiple n =>  n *  (n - 1) / 2
    ///     => approximately `O(n^2)`
    ///
    ///Space complexity `O(1)`
    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
        var slow = 0
        var fast = 1
        
        while slow < numbers.count {
            if numbers[slow] + numbers[fast] == target {
                return [slow + 1, fast + 1]
            }
            if fast == numbers.count - 1 {
                slow += 1
                fast = slow + 1
            } else {
                fast += 1
            }
        }
        
        return []
    }
    
    ///Time comlexity `O(n)`
    ///Space complexity `O(1)`
    func twoSum2(_ numbers: [Int], _ target: Int) -> [Int] {
        var slow = 0
        var fast = numbers.count - 1
        
        while slow < fast {
            if numbers[slow] + numbers[fast] == target {
                break
            } else {
                if numbers[slow] + numbers[fast] > target {
                    fast -= 1
                } else {
                    slow += 1
                }
            }
        }
        
        return [slow + 1, fast + 1]
    }
}

let res = Solution().twoSum2([2,7,11,15], 9)
let res1 = Solution().twoSum2([2,3,4], 6)
let res2 = Solution().twoSum2([-1,0], -1)
let res3 = Solution().twoSum2([1,2,3,4,4,9,56,90], 12)

//: [Next](@next)
