import UIKit

class Solution {
    ///Time complexity `O(m * n log n)` where m is length of `l` / `r`
    ///Space complexity `O(n)` is size of res array
    func checkArithmeticSubarrays(_ nums: [Int], _ l: [Int], _ r: [Int]) -> [Bool] {
        var res: [Bool] = Array(repeating: false, count: l.count)
        var curr: Int = 0
        
        while curr < l.count {
            var sub = Array(nums[l[curr]...r[curr]])
            sub.sort()
            
            var isArithmetic = true
            for i in 0..<sub.count - 1 {
                if sub[i+1] - sub[i] == sub[1] - sub[0] {
                    continue
                } else {
                    isArithmetic = false
                    break
                }
            }
            
            res[curr] = isArithmetic
            
            curr += 1
        }
        
        return res
    }
}

let res = Solution().checkArithmeticSubarrays([4,6,5,9,3,7], [0,0,2], [2,3,5])
let res1 = Solution().checkArithmeticSubarrays([-12,-9,-3,-12,-6,15,20,-25,-20,-15,-10], [0,1,6,4,8,7], [4,4,9,7,9,10])
