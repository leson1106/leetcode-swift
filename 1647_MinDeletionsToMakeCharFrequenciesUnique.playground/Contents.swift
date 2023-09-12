import UIKit

class Solution {
    
    ///A string s is called good if there are no two different characters in s that have the same frequency.
    ///Given a string s, return the minimum number of characters you need to delete to make s good.
    ///The frequency of a character in a string is the number of times it appears in the string. For example, in the string "aab", the frequency of 'a' is 2, while the frequency of 'b' is 1.
    ///
    ///     Input: s = "aab"
    ///     Output: 0
    ///     Explanation: s is already good.
    ///
    ///     Input: s = "aaabbbcc"
    ///     Output: 2
    ///     Explanation: You can delete two 'b's resulting in the good string "aaabcc".
    ///     Another way it to delete one 'b' and one 'c' resulting in the good string "aaabbc".
    ///
    ///     Input: s = "ceabaacb"
    ///     Output: 2
    ///     Explanation: You can delete both 'c's resulting in the good string "eabaab".
    ///     Note that we only care about characters that are still in the string at the end (i.e. frequency of 0 is ignored).
    ///
    ///Time Complexity `O(n * n)`
    ///Space Complexity `O(n + n)`
    func minDeletions(_ s: String) -> Int {
        var map: [Character: Int] = [:]
        
        for e in s {
            map[e, default: 0] += 1
        }
        
        var set: Set<Int> = .init()
        var res: Int = 0
        for str in map.keys {
            var count = map[str]!
            while set.contains(count) {
                count -= 1
                res += 1
            }
            if count > 0 {
                set.insert(count)
            }
        }
        
        return res
    }
}

let result = Solution().minDeletions("aab")
let result1 = Solution().minDeletions("aaabbbcc")
let result2 = Solution().minDeletions("ceabaacb")
