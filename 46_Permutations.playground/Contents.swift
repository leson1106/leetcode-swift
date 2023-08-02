import UIKit

/*
 Given an array nums of distinct integers, return all the possible permutations. You can return the answer in any order.

 Input: nums = [1,2,3]
 Output: [[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]]
 
 Input: nums = [0,1]
 Output: [[0,1],[1,0]]
 
 Input: nums = [1]
 Output: [[1]]
 */
class Solution {
    ///Time `O(n * n!)`
    ///Space `O(n)` where n is total nodes of curr
    func permute(_ nums: [Int]) -> [[Int]] {
        var ans: [[Int]] = []
        var curr: [Int] = []
        
        func backtrack(_ curr: inout [Int]) {
            if curr.count == nums.count {
                ans.append(curr)
                return
            } else {
                for num in nums {
                    if !curr.contains(num) {
                        curr.append(num)
                        backtrack(&curr)
                        _ = curr.removeLast()
                    }
                }
            }
        }
        
        backtrack(&curr)
        
        return ans
    }
}

//let nums = [1,2,3,4,5]
let nums = [1,2,3]
let result = Solution().permute(nums)
print(result.count)
print(result)

func findFactorial(_ n: Int) -> Int {
    if n == 0 { return 1 }
    var result = 1
    for i in 1...n {
        result *= i
    }
    return result
}

let numsF = findFactorial(nums.count)
