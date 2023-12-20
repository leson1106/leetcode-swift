import UIKit

class Solution {
    ///Time complexity `O(n)`
    ///Space complexity `O(1)`
    ///Keep tracking 2 smallest price
    func buyChoco(_ prices: [Int], _ money: Int) -> Int {
        var smallest = Int.max
        var nextSmallest = Int.max

        for price in prices {
            if price < smallest {
                let temp = smallest
                smallest = price
                nextSmallest = temp
            } else {
                nextSmallest = min(price, nextSmallest)
            }
        }

        let res =  money - smallest - nextSmallest
        if res >= 0 {
            return res
        } else {
            return money
        }
    }
}

let res = Solution().buyChoco([1,2,2], 3) //0
let res1 = Solution().buyChoco([3,2,3], 3) //3
