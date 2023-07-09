import UIKit

class Solution {
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        guard !nums.isEmpty else { return 0 }
        
        var i: Int = 0              //pointer from start
        var j: Int = nums.count - 1 //pointer from end
        
        while i != j {
            if nums[i] == val {
                if nums[j] == val { //equal to target, find other index to swap, move j
                    j -= 1
                } else { //do swap & move i
                    let target = nums[j]
                    let source = nums[i]
                    nums[i] = target
                    nums[j] = source
                    
                    i += 1
                }
            } else { //not equal, move i only
                i += 1
            }
        }
        
        if nums[j] == val {
            nums = Array(nums[0..<j])
        } else {
            nums = Array(nums[0...j])
        }
        return nums.count
    }
    
    func removeElement2(_ nums: inout [Int], _ val: Int) -> Int {
        var i: Int = 0
        var j: Int = 0
        var swapCount: Int = 0
        
        while j < nums.count {
            if nums[j] != val {
                //Do swap
                let target = nums[j]
                let source = nums[i]
                nums[i] = target
                nums[j] = source
                
                i += 1
                swapCount += 1
            }
            j += 1
        }
        return swapCount
    }
}

//var nums = [0,1,2,2,3,0,4,2]
//var nums = [3,2,2,3]
//var nums = [2, 3]
//var nums = [2]
//print(Solution().removeElement2(&nums, 2))
