import UIKit

class Solution {
    ///Given a string s, reverse the order of characters in each word within a sentence while still preserving whitespace and initial word order.
    ///
    ///     Example 1:
    ///     Input: s = "Let's take LeetCode contest"
    ///     Output: "s'teL ekat edoCteeL tsetnoc"
    ///
    ///     Example 2:
    ///     Input: s = "God Ding"
    ///     Output: "doG gniD"
    ///
    ///Time Complexity `O(n)`
    ///Space Complexicty `O(1)`
    func reverseWords(_ s: String) -> String {
        var res: String = ""
        var step: String = ""
        
        for c in s {
            if c.isWhitespace {
                res += step + " "
                step = ""
            } else {
                step = String(c) + step
            }
        }
        
        res += step
        
        return res
    }
}

let res = Solution().reverseWords("Let's take LeetCode contest")
let res1 = Solution().reverseWords("God Ding")
