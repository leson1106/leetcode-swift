import UIKit

class Solution {
    ///Iterate through matrix with conditions:
    ///1. If start of a row is 0, then flip this row
    ///2. If total zero of a column > total one of a column, then flip this column
    ///Time complexity O(n^2), space complexity O(n^2)
    func matrixScore(_ grid: [[Int]]) -> Int {
        var grid = grid
        let column = grid.count
        let row = grid[0].count

        for i in 0..<column {
            let firstNum = grid[i][0]
            //Flip row
            if firstNum == 0 {
                for j in 0..<row {
                    if grid[i][j] == 0 {
                        grid[i][j] = 1
                    } else {
                        grid[i][j] = 0
                    }
                }
            }
        }

        for i in 0..<row {
            var oneCount = 0
            var zeroCount = 0
            for j in 0..<column {
                if grid[j][i] == 0 {
                    zeroCount += 1
                } else {
                    oneCount += 1
                }
            }
            if zeroCount > oneCount {
                //Flip column
                for j in 0..<column {
                    if grid[j][i] == 0 {
                        grid[j][i] = 1
                    } else {
                        grid[j][i] = 0
                    }
                }
            }
        }

        var res = [[String]]()
        for i in 0..<column {
            var component = [String]()
            for j in 0..<row {
                component.append(String(grid[i][j]))
            }
            res.append(component)
        }

        var output = 0
        for each in res {
            let str = each.joined(separator: "")
            if let num = Int(str, radix: 2) {
                output += num
            }
        }

        return output
    }
}

let res = Solution().matrixScore([[0,0,1,1],[1,0,1,0],[1,1,0,0]])
let res1 = Solution().matrixScore([[0]])
