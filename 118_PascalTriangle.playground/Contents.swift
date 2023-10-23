import UIKit

class Solution {
    ///Given an integer numRows, return the first numRows of Pascal's triangle.
    ///
    ///     Input: numRows = 5
    ///     Output: [[1],[1,1],[1,2,1],[1,3,3,1],[1,4,6,4,1]]
    ///
    ///     Input: numRows = 1
    ///     Output: [[1]]
    ///
    ///Time complexity `O(n * n)`. Iterate through total rows cost n & iterate through each row cost n -> n^2
    ///Space complexity `O(n * n)` which n continuous triangle size from top to bottom 1->2->3 in both res & ele array
    func generate(_ numRows: Int) -> [[Int]] {
        var res: [[Int]] = []
        
        for i in 0..<numRows {
            var ele = Array(repeating: 1, count: i+1)
            if ele.count < 3 {
                res.append(ele)
            } else {
                let prevEle = res[i-1]
                for j in 0..<ele.count {
                    if j != 0 && j != ele.count - 1 {
                        ele[j] = prevEle[j - 1] + prevEle[j]
                    }
                }
                res.append(ele)
            }
        }
        
        return res
    }
}

let result = Solution().generate(5)
