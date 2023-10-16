//: [Previous](@previous)

import Foundation

class Solution {
    ///Time complexity `O(n(log n))` for sorting array & `O(n / 2)` for iterating array
    ///Space complexity `O(1)` (swift `O(n)` cause copy-on-write)
    func arrayPairSum(_ nums: [Int]) -> Int {
        var nums = nums.sorted()
        var slow: Int = 0
        var fast: Int = slow + 1
        var res: Int = 0
        while fast < nums.count {
            res += min(nums[slow], nums[fast])
            slow += 2
            fast += 2
        }
        return res
    }
}

let res = Solution().arrayPairSum([1,4,3,2])
let res1 = Solution().arrayPairSum([6,2,6,5,1,2])

//: [Next](@next)
