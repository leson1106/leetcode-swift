import UIKit

///`Merge sort`
class Solution {
    func mergeArray(_ array: [Int]) -> [Int] {
        guard array.count > 1 else { return array }
        
        let pivot = array.count / 2
        let left = mergeArray(Array(array[0..<pivot]))
        let right = mergeArray(Array(array[pivot..<array.count]))
        return _merge(left, right)
    }
    
    private func _merge(_ left: [Int], _ right: [Int]) -> [Int] {
        var res = Array(repeatElement(0, count: left.count + right.count))
        var lIndex = 0
        var rIndex = 0
        var currIndex = 0
        while lIndex < left.count && rIndex < right.count {
            if left[lIndex] < right[rIndex] {
                res[currIndex] = left[lIndex]
                lIndex += 1
            } else {
                res[currIndex] = right[rIndex]
                rIndex += 1
            }
            currIndex += 1
        }
        
        for i in lIndex..<left.count {
            res[currIndex] = left[i]
            currIndex += 1
        }
        for i in rIndex..<right.count {
            res[currIndex] = right[i]
            currIndex += 1
        }
        return res
    }
}

let res = Solution().mergeArray([1,5,3,2,8,7,6,4])
