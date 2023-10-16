//: [Previous](@previous)

import Foundation

class Solution {
    func plusOne(_ digits: [Int]) -> [Int] {
        var res: [Int] = Array(repeating: 0, count: digits.count)
        var surplus: Int = 0
        var j = digits.count - 1
        
        while j >= 0 {
            let num = digits[j]
            if j == digits.count - 1 {
                res[j] = (num + 1) % 10
                surplus = ((num + 1) >= 10) ? 1 : 0
            } else {
                if num + surplus >= 10 {
                    res[j] = (num + surplus) % 10
                } else {
                    res[j] = num + surplus
                    surplus = 0
                }
            }
            j -= 1
        }
        if surplus != 0 {
            res.insert(surplus, at: 0)
        }
        return res
    }
}

let res = Solution().plusOne([1,2,3])
let res1 = Solution().plusOne([4,3,2,1])
let res2 = Solution().plusOne([9,9,9,9])
let res3 = Solution().plusOne([8,9,9,9])
//: [Next](@next)
