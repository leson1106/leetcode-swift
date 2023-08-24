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
    
    ///Given two arrays of strings list1 and list2, find the common strings with the least index sum.
    ///A common string is a string that appeared in both list1 and list2.
    ///A common string with the least index sum is a common string such that if it appeared at list1[i] and list2[j] then i + j should be the minimum value among all the other common strings.
    ///Return all the common strings with the least index sum. Return the answer in any order.
    ///
    ///     Input: list1 = ["Shogun","Tapioca Express","Burger King","KFC"], list2 = ["Piatti","The Grill at Torrey Pines","Hungry Hunter Steakhouse","Shogun"]
    ///     Output: ["Shogun"]
    ///     Explanation: The only common string is "Shogun".
    ///
    ///     Input: list1 = ["Shogun","Tapioca Express","Burger King","KFC"], list2 = ["KFC","Shogun","Burger King"]
    ///     Output: ["Shogun"]
    ///     Explanation: The common string with the least index sum is "Shogun" with index sum = (0 + 1) = 1.
    ///
    ///     Input: list1 = ["happy","sad","good"], list2 = ["sad","happy","good"]
    ///     Output: ["sad","happy"]
    ///     Explanation: There are three common strings:
    ///     "happy" with index sum = (0 + 1) = 1.
    ///     "sad" with index sum = (1 + 0) = 1.
    ///     "good" with index sum = (2 + 2) = 4.
    ///     The strings with the least index sum are "sad" and "happy".
    ///
    ///Time complexity  `O(n + m)` for iterating 2 lists (which n & m is string length) and plus `O(p)` which p is map size
    ///=> `O(n + m + p)`
    ///Space complexity `O(n + m)` which n + m is map size = size of 2 strings in worse case and plus `O(p)` which p is result size
    ///=> `O(n + m + p)
    func findRestaurant(_ list1: [String], _ list2: [String]) -> [String] {
        var list1 = list1.map { String($0) }
        var list2 = list2.map { String($0) }
        
        var map: [String: [Int]] = [:]
        var minSumIndexes: Int = Int.max
        
        func convert(_ list: [String], to map: inout [String: [Int]]) {
            for i in 0..<list.count {
                if !map.keys.contains(list[i]) {
                    map[list[i]] = [i]
                } else {
                    var val = map[list[i]]
                    val?.append(i)
                    map[list[i]] = val!
                    
                    let sum = val!.reduce(0, +)
                    minSumIndexes = minSumIndexes < sum ? minSumIndexes : sum
                }
            }
        }
        
        convert(list1, to: &map)
        convert(list2, to: &map)
        
        var result: [String] = []
        
        for (key, values) in map where values.count > 1 {
            if values.reduce(0, +) == minSumIndexes {
                result.append(key)
            }
        }
        
        return result
    }
    
    ///Time complexity  `O(n + m)` where n & m is 2 strings length
    ///Space complexity `O(n + p)` where n is map size & m is result size
    func findRestaurant2(_ list1: [String], _ list2: [String]) -> [String] {
        let list1 = list1.map { String($0) }
        let list2 = list2.map { String($0) }
        
        var map: [String: Int] = [:]
        var result: [String] = []
        var minSumIndexes: Int = Int.max
        
        //added all elements in list 1 to map
        for i in 0..<list1.count {
            map[list1[i]] = i
        }
        
        //following by requirement, always have unique items so ignore items which is not in map
        //just combine items which included in map
        for i in 0..<list2.count where map.keys.contains(list2[i]) {
            var val = map[list2[i]]!
            val += i
            
            //min sum changed, clear result
            if minSumIndexes > val {
                result.removeAll()
                minSumIndexes = val
                result.append(list2[i])
            //min sum == val, append more element has same sum indexes
            } else if minSumIndexes == val {
                result.append(list2[i])
            }
        }
        return result
    }
    
    ///Using map
    ///Time complexity `O(n + m)` which n is s length & m is map size
    ///Space complexity `O(m)` which n is map size
    func firstUniqChar(_ s: String) -> Int {
        let s = s.map { String($0) }
        var map: [String: (count: Int, index: Int)] = [:]
        for i in 0..<s.count {
            if map.keys.contains(s[i]) {
                var val = map[s[i]]!
                val.count += 1
                map[s[i]] = val
            } else {
                map[s[i]] = (count: 1, index: i)
            }
        }
        
        var minIndex: Int = .max
        for (_, val) in map where val.count == 1 {
            minIndex = minIndex > val.index ? val.index : minIndex
        }
        
        return minIndex != .max ? minIndex : -1
    }
    
    ///Using array
    ///Time complexity `O(n)` which n is s length
    ///Space complexity `O(1)` no extra space needed except aplhabet 26 letters
    func firstUniqChar2(_ s: String) -> Int {
        //26 letters
        var letters = Array(repeating: 0, count: 26)
        //searched the UnicodeScalar
        let a = UnicodeScalar("a").value
        s.unicodeScalars.forEach{ c in
            letters[Int(c.value - a)] += 1
        }
        var i = 0
        for c in s.unicodeScalars {
            if letters[Int(c.value - a)] == 1 {
                return i
            }
            i += 1
        }
        return -1
    }
    
    ///Given two integer arrays nums1 and nums2, return an array of their intersection.
    ///Each element in the result must appear as many times as it shows in both arrays and you may return the result in any order.
    ///
    ///     Input: nums1 = [1,2,2,1], nums2 = [2,2]
    ///     Output: [2,2]
    ///
    ///     Input: nums1 = [4,9,5], nums2 = [9,4,9,8,4]
    ///     Output: [4,9] | [9,4] is also accepted.
    ///
    ///Time complexity  `O(n + m)` which n & m is 2 array's elements
    ///Space complexity `O(n)` which n is map size = smaller array size in worse case
    func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var map: [Int: Int] = [:]
        
        func findIntersect(bigger: [Int], smaller: [Int]) -> [Int] {
            
            var result: [Int] = []
            
            for num in smaller {
                if map.keys.contains(num) {
                    map[num]? += 1
                } else {
                    map[num] = 1
                }
            }
            
            for i in 0..<bigger.count {
                if map.keys.contains(bigger[i]) {
                    var count = map[bigger[i]]!
                    count -= 1
                    map[bigger[i]] = count
                    
                    if count >= 0 {
                        result.append(bigger[i])
                    }
                    
                    if count == 0 {
                        map[bigger[i]] = nil
                    }
                }
            }
            
            return result
        }
        
        if nums1.count > nums2.count {
            return findIntersect(bigger: nums1, smaller: nums2)
        } else {
            return findIntersect(bigger: nums2, smaller: nums1)
        }
    }
    
    ///Given an integer array nums and an integer k, return true if there are two distinct indices i and j
    ///in the array such that nums[i] == nums[j] and abs(i - j) <= k.
    ///
    ///     Input: nums1 = [1,2,3,1], k = 3
    ///     Output: true
    ///
    ///     Input: nums = [1,0,1,1], k = 1
    ///     Output: true
    ///
    ///     Input: nums = [1,2,3,1,2,3], k = 2
    ///     Output: false
    ///
    ///Time complexity  `O(n)` which n nums size
    ///Space complexity `O(n)` which n is map size
    func containsNearbyDuplicate(_ nums: [Int], _ k: Int) -> Bool {
        var map: [Int: Int] = [:] /*[num: index]*/
        
        for i in 0..<nums.count {
            if map.keys.contains(nums[i]) {
                let prevIndex = map[nums[i]]!
                let absIndexes = abs(prevIndex - i)
                if absIndexes <= k {
                    return true
                } else {
                    map[nums[i]] = i
                }
            } else {
                map[nums[i]] = i
            }
        }
        
        return false
    }
}

//two sum
//let result = Solution().twoSum([2,7,11,15], 9)
//let result1 = Solution().twoSum([3,2,4], 6)
//let result2 = Solution().twoSum([3,3], 6)
//let result3 = Solution().twoSum([4,-2,5,0,6,3,2,7], 1)

//is isomorphic
//let result = Solution().isIsomorphic("egg", "add")
//let result1 = Solution().isIsomorphic("foo", "bar")
//let result2 = Solution().isIsomorphic("paper", "title")
//let result4 = Solution().isIsomorphic("badc", "baba")

//find restaurant
//let result = Solution().findRestaurant2(["Shogun","Tapioca Express","Burger King","KFC"], ["Piatti","The Grill at Torrey Pines","Hungry Hunter Steakhouse","Shogun"])
//let result1 = Solution().findRestaurant2(["Shogun","Tapioca Express","Burger King","KFC"], ["KFC","Shogun","Burger King"])
//let result2 = Solution().findRestaurant2(["happy","sad","good"], ["sad","happy","good"])

//first uniqChar
//let result = Solution().firstUniqChar2("leetcode")
//let result1 = Solution().firstUniqChar2("loveleetcode")
//let result2 = Solution().firstUniqChar2("aabb")

//intersect
//let result = Solution().intersect([1,2,2,1], [2,2])
//let result1 = Solution().intersect([4,9,5], [9,4,9,8,4])

//contains nearby duplicate
let result = Solution().containsNearbyDuplicate([1,2,3,1], 3)
let result1 = Solution().containsNearbyDuplicate([1,0,1,1], 1)
let result2 = Solution().containsNearbyDuplicate([1,2,3,1,2,3], 2)

//: [Next](@next)
