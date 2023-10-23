import UIKit

class Solution {
    ///Time complexity `O(n)` with n is groupSizes size
    ///Space complexity `O(n + m)` with n is map size convert from groupSizes and m is size of result array
    func groupThePeople(_ groupSizes: [Int]) -> [[Int]] {
        var map: [Int: [Int]] = [:]
        var res: [[Int]] = []
        
        for i in 0..<groupSizes.count {
            let key = groupSizes[i]
            if var arr = map[key] {
                arr.append(i)
                map[key] = arr
            } else {
                map[key] = [i]
            }
            
            var arr = map[key] ?? []
            if arr.count == key {
                res.append(arr)
                map[key] = []
            }
        }
        
        return res
    }
}

let sizes = [3,3,3,3,3,1,3]
let sizes2 = [2,1,3,3,3,2]
let result = Solution().groupThePeople(sizes)
let result2 = Solution().groupThePeople(sizes2)
