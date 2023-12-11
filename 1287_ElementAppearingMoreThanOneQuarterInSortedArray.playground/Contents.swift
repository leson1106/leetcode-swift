import UIKit

class Solution {
    /// Given an integer array sorted in non-decreasing order, there is exactly one integer in the array that occurs more than 25% of the time, return that integer.
    ///
    ///     Example 1:
    ///     Input: arr = [1,2,2,6,6,6,6,7,10]
    ///     Output: 6
    ///
    ///     Example 2:
    ///     Input: arr = [1,1]
    ///     Output: 1
    ///
    /// Time complexity O(n), space complexity O(1)
    /// There is an optimal way, it's binary search TC O (log n), SC O(1)
    func findSpecialInteger(_ arr: [Int]) -> Int {
        guard arr.count > 3 else {
            return arr.first!
        }

        var maxCount = Float(arr.count) / 4.0
        var streak = 1
        for i in 0..<arr.count - 1 {
            if arr[i] == arr[i+1] {
                streak += 1
            } else {
                streak = 1
            }
            if streak >= Int(maxCount + 1) {
                return arr[i]
            }
        }

        return -1
    }
}
