import UIKit

class Solution {
    ///Sort then map 1-1 positions between seats[i] and students[i]
    ///Time complexity `O(n log n)`, Space complexity `O(1)`
    func minMovesToSeat(_ seats: [Int], _ students: [Int]) -> Int {
        var seats = seats.sorted()
        var students = students.sorted()

        var count = 0
        //seats and students have same n length
        for i in seats.indices {
            count += abs(seats[i] - students[i])
        }
        return count
    }
}

let res1 = Solution().minMovesToSeat([3,1,5], [2,7,4])
let res2 = Solution().minMovesToSeat([4,1,5,9], [1,3,2,6])
let res3 = Solution().minMovesToSeat([2,2,6,6], [1,3,2,6])
