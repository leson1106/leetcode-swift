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
    func reverseWords3(_ s: String) -> String {
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
    
    ///Given an input string s, reverse the order of the words.
    ///A word is defined as a sequence of non-space characters. The words in s will be separated by at least one space.
    ///Return a string of the words in reverse order concatenated by a single space.
    ///Note that s may contain leading or trailing spaces or multiple spaces between two words. The returned string should only have a single space separating the words. Do not include any extra spaces.
    ///
    ///     Example 1:
    ///     Input: s = "the sky is blue"
    ///     Output: "blue is sky the"
    ///
    ///     Example 2:
    ///     Input: s = "  hello world  "
    ///     Output: "world hello"
    ///
    ///     Example 3:
    ///     Input: s = "a good   example"
    ///     Output: "example good a"
    ///
    ///Time Complexity `O(n)`
    ///Space Complexicty `O(1)`
    func reverseWords(_ s: String) -> String {
        var res: String = ""
        var step: String = ""
        
        var countSpace: Int = 0
        var hadSpace: Bool = false
        
        for c in s {
            if c.isWhitespace && countSpace != 0 { continue }
            
            if c.isWhitespace {
                hadSpace = true
                countSpace = 1
                res = step + (res == "" ? "" : " ") + res
                step = ""
            } else {
                countSpace = 0
                step += String(c)
            }
        }
        
        if step != "" {
            res = step + (hadSpace ? " " : "") + res
        }
        
        return res
    }
}

//let res = Solution().reverseWords3("Let's take LeetCode contest")
//let res1 = Solution().reverseWords3("God Ding")

let res2 = Solution().reverseWords("the sky is blue")
let res3 = Solution().reverseWords("  hello world  ")
let res4 = Solution().reverseWords("a good   example")
let res5 = Solution().reverseWords("EPY2giL")
