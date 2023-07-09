import Foundation

/* i.e: raw [-4,-1,0,3,10] -> [a,b,c,d,e]
 Create a new array using 2 pointers from 0 to end and end to 0
 
 1. [-4, -1, 0, 3, 10]
     i              j
    i*i = 16, j*j = 100, 16 < 100 -> [a,b,c,d,100]
 
 2. [-4, -1, 0, 3, 10]
     i          j
    i*i = 16, j*j = 9, 16 > 9 -> [a,b,c,16,100]
 
 3. [-4, -1, 0, 3, 10]
         i      j
    i*i = 1, j*j = 9, 1 < 9 -> [a,b,9,16,100]
 
 and so forth
 */
class Solution {
    func oldOne(_ nums: [Int]) -> [Int] {
        let minElement: Int = 1
        let maxElement: Int = Int(pow(Double(10), Double(4)))
        
        let minElementValue: Int = -Int(pow(Double(10), Double(4)))
        let maxElementValue: Int = Int(pow(Double(10), Double(4)))
        
        guard nums.count >= minElement && nums.count <= maxElement else { return [] }
        
        let positiveNums = nums
            .filter { $0 >= minElementValue && $0 <= maxElementValue }
            .map { abs($0) }
            .map { $0 * $0 }
            .sorted()
        
        let convertedNums = positiveNums.map { Int($0) }
        
        return convertedNums
    }
    
    func sortedSquares(_ nums: [Int]) -> [Int] {
        var sorted = [Int](repeating: 0, count: nums.count)
        
        var i: Int = 0
        var j: Int = nums.count - 1
        
        var currentIndex = nums.count - 1
        
        //compare to -1 with final loop when i == j to replace first index
        while currentIndex != -1 {
            if abs(nums[i]) <= abs(nums[j]) {
                sorted[currentIndex] = nums[j] * nums[j]
                j -= 1
            } else {
                sorted[currentIndex] = nums[i] * nums[i]
                i += 1
            }
            currentIndex -= 1
        }
        
        return sorted
    }
}

//let nums = [-4,-1,0,3,10]
let nums = [-7,-3,2,3,11]
Solution().sortedSquares(nums)
