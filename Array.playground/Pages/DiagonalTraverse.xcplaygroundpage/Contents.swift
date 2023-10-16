//: [Previous](@previous)

import Foundation

class Solution {
    func strStr(_ haystack: String, _ needle: String) -> Int {
        guard let range = haystack.range(of: needle) else { return -1 }
        let distance = haystack.distance(from: haystack.startIndex, to: range.lowerBound)
        return distance
    }
}

let res = Solution().strStr("sadbutsad", "sad")
let res1 = Solution().strStr("leetcode", "leeto")
let res2 = Solution().strStr("hello", "llo")
let res3 = Solution().strStr("4322", "1")

//: [Next](@next)
