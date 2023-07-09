import Foundation

class Solution {
    func heightChecker(_ heights: [Int]) -> Int {
        var sorted = heights.sorted()
        
        var count: Int = 0
        
        for i in 0..<sorted.count {
            count += sorted[i] != heights[i] ? 1 : 0
        }
        
        return count
    }
}
