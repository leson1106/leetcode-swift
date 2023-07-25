import UIKit

class Solution {
    ///Linear
    ///Time `O(n)` in worst-case
    ///Space `O(1)`
    func peakIndexInMountainArray(_ arr: [Int]) -> Int {
        guard arr.count >= 3 else { return -1 }
        
        var i = 0
        while i < arr.count - 1 {
            if arr[i] < arr[i + 1] {
                i += 1
            }
        }
        return i
    }
    
    ///Binary
    ///Time `O(log n)`
    ///Space `O(1)`
    func peakIndexInMountainArray2(_ arr: [Int]) -> Int {
        guard arr.count >= 3 else { return -1 }
        
        var left = 0
        var right = arr.count - 1
        var mid = 0
        
        while left < right {
            mid = left + (right - left) / 2
            if mid + 1 <= right, mid - 1 >= left, arr[mid] > arr[mid + 1], arr[mid] > arr[mid - 1] {
                return mid
            } else if mid + 1 <= right, arr[mid] > arr[mid + 1] {
                right = mid
            } else {
                left = mid + 1
            }
        }
        return mid
    }
}

//let array = [0,2,1,0]
//let array = [0,1,0]
//let array = [0,10,5,2]
let array = [0,8,9,10,5,2]
let value = Solution().peakIndexInMountainArray2(array)
