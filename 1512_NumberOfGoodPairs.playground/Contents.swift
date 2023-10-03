import UIKit

class Solution {
    ///Time complexity `O((n * (n+1) / 2))` -> `O(n * n)`
    ///Space complexity `O(1)`
    func numIdenticalPairs(_ nums: [Int]) -> Int {
        var slow = 0
        var fast = slow + 1
        var count = 0
        
        while slow < nums.count && fast < nums.count {
            if nums[slow] == nums[fast] {
                count += 1
            }
            
            if fast == nums.count - 1 {
                slow += 1
                fast = slow + 1
            } else {
                fast += 1
            }
        }
        return count
    }
    
    ///Time complexity `O(n)`
    ///Space complexity `O(n)`
    func numIdenticalPairs2(_ nums: [Int]) -> Int {
        var map: [Int: Int] = [:]
        var res = 0
        for num in nums {
            res += map[num] ?? 0
            map[num, default: 0] += 1
        }
        return res
    }
}

let res = Solution().numIdenticalPairs([1,2,3,1,1,3])
//let res1 = Solution().numIdenticalPairs([1,1,1,1])
//let res2 = Solution().numIdenticalPairs([1,2,3])

func calculateFactorial(_ n: Int) -> Int {
    var res: Int = 1
    for i in 1...n {
        res *= i
    }
    return res
}

func calculatePartialSum(_ n: Int) -> Int {
    var res: Int = 0
    for i in 0...n {
        res += i
    }
    return res
}

let output = calculateFactorial(6)
let output1 = calculatePartialSum(5)
