//: [Previous](@previous)

import Foundation

class Solution {
    ///Given an array of strings strs, group the anagrams together. You can return the answer in any order.
    ///An Anagram is a word or phrase formed by rearranging the letters of a different word or phrase, typically using all the original letters exactly once.
    ///
    ///     Input: strs = ["eat","tea","tan","ate","nat","bat"]
    ///     Output: [["bat"],["nat","tan"],["ate","eat","tea"]]
    ///
    ///     Input: strs = [""]
    ///     Output: [[""]]
    ///
    ///     Input: strs = ["a"]
    ///     Output: [["a"]]
    ///
    ///Time complexity : `O(n)` which n nums size, `O(m * log(m))` as expected from built in sort algorithm where m is each str length, get values from map take `O(1)`
    ///=> `O(n * m * log(m))`
    ///
    ///Space complexity `O(n*k)` which n is map size and k is longest string
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var map: [String: [String]] = [:]
        
        for i in 0..<strs.count {
            //sorted string to get unique key of each group
            var str = String(strs[i].sorted())
            
            if map.keys.contains(str) {
                var val = map[str] ?? []
                val.append(strs[i])
                map[str] = val
            } else {
                map[str] = [strs[i]]
            }
        }
        return Array(map.values)
    }
    
    ///Time complexity `O(n + m)` which n is jewels string length and m is stones string length
    ///Space complexity `O(n)` which n is size of set + `O(1)` for couting => `O(n)` in total
    func numJewelsInStones(_ jewels: String, _ stones: String) -> Int {
        var jewelSet = Set(jewels)
        
        var jCount = 0
        for s in stones {
            if jewelSet.contains(s) {
                jCount += 1
            }
        }
        
        return jCount
    }
    
    ///Time complexity `O(n)` which n is s length
    ///Space comlexity `O(m)` which m is map size + `longest` & `startIndex` cost `O(1)` => `O(n)` in total
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var longest = 0, startIndex = 0
        var charMap: [Character: Int] = [:]
        
        for (index, char) in s.enumerated() {
            if let foundIndex = charMap[char] {
                startIndex = max(foundIndex+1, startIndex)
            }
            longest = max(longest, index - startIndex + 1)
            charMap[char] = index
        }
        return longest
    }
}

//groupAnagrams
//let result = Solution().groupAnagrams(["eat","tea","tan","ate","nat","bat"])
//let result1 = Solution().groupAnagrams([""])
//let result2 = Solution().groupAnagrams(["a"])

//let result = Solution().numJewelsInStones("aA", "aAAbbbb")
//let result1 = Solution().numJewelsInStones("z", "ZZ")

let result = Solution().lengthOfLongestSubstring("abcabcbb")
let result1 = Solution().lengthOfLongestSubstring("bbbbb")
let result2 = Solution().lengthOfLongestSubstring("pwwkew")
let result3 = Solution().lengthOfLongestSubstring("dvdf")
let result4 = Solution().lengthOfLongestSubstring("anviaj")

//: [Next](@next)
