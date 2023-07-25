import UIKit

/*
 Given an integer array nums sorted in non-decreasing order, remove some duplicates in-place such that each unique element appears at most twice. The relative order of the elements should be kept the same.

 Since it is impossible to change the length of the array in some languages, you must instead have the result be placed in the first part of the array nums. More formally, if there are k elements after removing the duplicates, then the first k elements of nums should hold the final result. It does not matter what you leave beyond the first k elements.

 Return k after placing the final result in the first k slots of nums.

 Do not allocate extra space for another array. You must do this by modifying the input array in-place with O(1) extra memory.
 
 Input: nums = [1,1,1,2,2,3]
 Output: 5, nums = [1,1,2,2,3,_]
 Explanation: Your function should return k = 5, with the first five elements of nums being 1, 1, 2, 2 and 3 respectively.
 It does not matter what you leave beyond the returned k (hence they are underscores).
 
 Input: nums = [0,0,1,1,1,1,2,3,3]
 Output: 7, nums = [0,0,1,1,2,3,3,_,_]
 Explanation: Your function should return k = 7, with the first seven elements of nums being 0, 0, 1, 1, 2, 3 and 3 respectively.
 It does not matter what you leave beyond the returned k (hence they are underscores).
 */
class Solution {
    ///Time `O(n)`
    ///Space `O(1)`
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        var i = 0
        var j = 0
        var count = 1
        
        while i < nums.count {
            if i + 1 < nums.count, nums[i] == nums[i + 1] {
                count += 1
            } else {
                count = 1
            }
            
            if count < 3 {
                nums.swapAt(i, j)
                j += 1
            }
            
            i += 1
        }
        
        return j
    }
}

//var array = [0,0,1,1,1,1,2,3,3]
var array = [1,1,1,2,2,3]
let result = Solution().removeDuplicates(&array)
print(array)
