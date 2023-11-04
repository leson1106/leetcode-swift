import UIKit

class Solution {
    ///`m is length of matrix, n is length of matrix[0]`
    
    ///Brute force
    ///TC `O(m*n)`
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        for i in 0..<matrix.count {
            for j in 0..<matrix[i].count {
                if matrix[i][j] == target {
                    return true
                }
            }
        }
        return false
    }
    
    ///Tricky way to start from top-right
    ///TC `O(m + n)`
    func searchMatrix2(_ matrix: [[Int]], _ target: Int) -> Bool {
        let row = matrix.count
        let column = matrix[0].count
        
        var i = 0
        var j = column - 1
        while i < row && j >= 0 {
            let num = matrix[i][j]
            guard num != target else {
                return true
            }
            if num > target {
                j -= 1
            } else {
                i += 1
            }
        }
        return false
    }
}
