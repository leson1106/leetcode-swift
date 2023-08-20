//: [Previous](@previous)

import Foundation

class Solution {
    ///Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target.
    ///You may assume that each input would have exactly one solution, and you may not use the same element twice.
    ///You can return the answer in any order.
    ///
    ///     Input: nums = [2,7,11,15], target = 9
    ///     Output: [0,1]
    ///     Explanation: Because nums[0] + nums[1] == 9, we return [0, 1].
    ///
    ///     Input: nums = [3,2,4], target = 6
    ///     Output: [1,2]
    ///
    ///     Input: nums = [3,3], target = 6
    ///     Output: [0,1]
    ///
    ///Time complexity  `O(n)` which n is array elements
    ///Space complexity `O(n)` which n is map size = array size in worse case
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        guard !nums.isEmpty else { return [] }
        
        var map: [Int: Int] = [:]
        
        for i in 0..<nums.count {
            let valueToFind = target - nums[i]
            
            if map[valueToFind] != nil {
                if let index = map[valueToFind], valueToFind + nums[i] == target {
                    return [index, i]
                } else {
                    continue
                }
            } else {
                map[nums[i]] = i
            }
        }
        
        return []
    }
    
    ///Given two strings s and t, determine if they are isomorphic.
    ///Two strings s and t are isomorphic if the characters in s can be replaced to get t.
    ///All occurrences of a character must be replaced with another character while preserving the order of characters. No two characters may map to the same character, but a character may map to itself.
    ///
    ///     Input: s = "egg", t = "add"
    ///     Output: true
    ///
    ///     Input: s = "foo", t = "bar"
    ///     Output: false
    ///
    ///     Input: s = "paper", t = "title"
    ///     Output: true
    ///
    ///Time complexity  `O(n)` which n is array elements
    ///Space complexity `O(n)` which n is map size = array size in worse case
    func isIsomorphic(_ s: String, _ t: String) -> Bool {
        guard s.count == t.count else { return false }
        
        var s = s.map { String($0) }
        var t = t.map { String($0) }
        var map: [String: String] = [:]
        
        for i in 0..<s.count {
            let sVal = s[i]
            let tVal = t[i]
            if !map.keys.contains(sVal) {
                if !map.values.contains(tVal) {
                    map[sVal] = tVal
                } else {
                    return false
                }
            } else if map[sVal] != tVal {
                return false
            }
        }
        return true
    }
}

//two sum
//let result = Solution().twoSum([2,7,11,15], 9)
//let result1 = Solution().twoSum([3,2,4], 6)
//let result2 = Solution().twoSum([3,3], 6)
//let result3 = Solution().twoSum([4,-2,5,0,6,3,2,7], 1)

//is isomorphic
let result = Solution().isIsomorphic("egg", "add")
let result1 = Solution().isIsomorphic("foo", "bar")
let result2 = Solution().isIsomorphic("paper", "title")
let result4 = Solution().isIsomorphic("badc", "baba")

//: [Next](@next)
