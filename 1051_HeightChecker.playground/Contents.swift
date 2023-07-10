import Foundation

class Solution {
    func oldOne(_ heights: [Int]) -> Int {
        var sorted = heights.sorted()
        
        var count: Int = 0
        
        for i in 0..<sorted.count {
            count += sorted[i] != heights[i] ? 1 : 0
        }
        
        return count
    }
    
    func heightChecker(_ heights: [Int]) -> Int {
        var sorted = heights
        
        for i in stride(from: sorted.count - 1, to: 1, by: -1) {
            for j in 0..<i where sorted[j] > sorted[j + 1] {
                sorted.swapAt(j, j + 1)
            }
        }
        
        var count: Int = 0
        for i in 0..<sorted.count {
            if sorted[i] != heights[i] {
                count += 1
            }
        }
        return count
    }
}

//var nums = [2,1,4,5,6,3]
var nums = [1,1,4,2,1,3]
let result = Solution().heightChecker(nums)
