//: [Previous](@previous)

import Foundation

class Solution {
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
}

let res = Solution().getRow(0)
let res1 = Solution().getRow(3)
let res2 = Solution().getRow(5)

//: [Next](@next)
