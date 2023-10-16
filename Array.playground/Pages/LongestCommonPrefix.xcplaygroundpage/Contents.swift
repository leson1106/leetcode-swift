//: [Previous](@previous)

import Foundation

class Solution {
    func longestCommonPrefix(_ strs: [String]) -> String {
        guard !strs.isEmpty else { return "" }
        var prefix = strs[0]
        guard prefix != "" else { return "" }
        for i in 1..<strs.count {
            while NSString(string: strs[i]).range(of: prefix).lowerBound > 0 {
                let end = prefix.index(before: prefix.endIndex)
                prefix = String(prefix[prefix.startIndex..<end])
                if prefix.isEmpty { return "" }
            }
        }
        return prefix
    }
}

let res = Solution().longestCommonPrefix(["flower","flow","flight"])
let res1 = Solution().longestCommonPrefix(["dog","racecar","car"])
let res2 = Solution().longestCommonPrefix(["",""])

//: [Next](@next)
