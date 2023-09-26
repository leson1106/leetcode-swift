import UIKit

class Solution {
    ///Time complexity `O(n * log n)` where `n` is iterate through temperatures array and `log n` is stack size while keep popping to compare
    ///Space complexity `O(n + m)` where `n` is result size equal to input size & `m` is stack size
    func dailyTemperatures(_ temperatures: [Int]) -> [Int] {
        guard !temperatures.isEmpty else { return [] }
        
        var stack: [(Int, Int)] = [] /*(temp, index) */
        var res: [Int] = Array(repeating: -1, count: temperatures.count)
        
        for i in 0..<temperatures.count {
            let temp = temperatures[i]
            guard !stack.isEmpty else {
                stack.append((temp, i))
                continue
            }
            var stackCount = stack.count
            //Pop all stack elements to compare
            while stackCount > 0 {
                if let ele = stack.last, ele.0 < temp {
                    _ = stack.removeLast()
                    res[ele.1] = i - ele.1
                }
                stackCount -= 1
            }
            stack.append((temp, i))
        }
        
        //These last elements fill with 0
        var index = stack.count
        while index > 0 {
            let ele = stack.removeLast()
            res[ele.1] = 0
            index -= 1
        }
        
        return res
    }
}

let res1 = Solution().dailyTemperatures([73,74,75,71,69,72,76,73])
let res2 = Solution().dailyTemperatures([30,40,50,60])
let res3 = Solution().dailyTemperatures([30,60,90])
