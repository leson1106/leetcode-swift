import UIKit

class Solution {
    ///Time `O(n * log n)` based on built-in sorting algorithm
    ///Space `O(n)`
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        let nums = nums.sorted()
        return nums[nums.count - k]
    }
    
    ///`Min-Heap`
    func findKthLargest2(_ nums: [Int], _ k: Int) -> Int {
        return -1
    }
    
    ///`Quick select`
    func findKthLargest3(_ nums: [Int], _ k: Int) -> Int {
        func quickSelect(_ nums: [Int], _ k: Int) -> Int {
            let pivotIndex = Int.random(in: 0..<nums.count)
            let pivot = nums[pivotIndex]
            
            var left: [Int] = []
            var mid: [Int] = []
            var right: [Int] = []
            
            for num in nums {
                if num > pivot {
                    left.append(num)
                } else if num < pivot {
                    right.append(num)
                } else {
                    mid.append(num)
                }
            }
            
            if left.count >= k {
                return quickSelect(left, k)
            }
            if (left.count + mid.count) < k {
                return quickSelect(right, k - left.count - mid.count)
            }
            return pivot
        }
        return quickSelect(nums, k)
    }
}

//let nums = [3,2,1,5,6,4]
let nums = [3,2,3,1,2,4,5,5,6]
//let k = 2
let k = 4
let result = Solution().findKthLargest3(nums, k)
