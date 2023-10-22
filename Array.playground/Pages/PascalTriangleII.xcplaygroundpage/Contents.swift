//: [Previous](@previous)

import Foundation

class Solution {
    ///Time complexity `O(rowIndex ^ 2)` which n is depth and m is breadth of triangle
    ///Space `O(n + m)` where n is triangle elements and m is res
    func getRow(_ rowIndex: Int) -> [Int] {
        var triangle = [[Int]]()
        var res = [Int]()
        for i in 0...rowIndex {
            var element = Array(repeating: 1, count: i + 1)
            if i >= 2 {
                for j in 0..<element.count {
                    if j != 0 && j != element.count - 1 {
                        let prevLevel = triangle[i-1]
                        element[j] = prevLevel[j-1] + prevLevel[j]
                    }
                }
            }
            if i == rowIndex {
                res = element
            }
            triangle.append(element)
        }
        return res
    }
    
    ///Following by formula: `arr[i] = arr[i - 1] * (row - i + 1) / i`
    ///Time complexity `O(n)`
    ///Space complexity `O(1)`
    func getRow2(_ rowIndex: Int) -> [Int] {
        guard rowIndex > 0 else { return [1] }
        var res = Array(repeating: 1, count: rowIndex + 1)
        for i in 1..<rowIndex {
            res[i] = res[i - 1] * (rowIndex - i + 1) / i
        }
        return res
    }
}

let res = Solution().getRow2(0)
let res1 = Solution().getRow2(3)
let res2 = Solution().getRow2(4)
let res3 = Solution().getRow2(5)

//: [Next](@next)
