import UIKit

class Solution {
    ///Convert to ascii and check sum
    ///Time complexity `O(s + t)` which s & t are string lengths
    ///Space complexity `O(1)`
    func findTheDifference(_ s: String, _ t: String) -> Character {
        var ans: Int = 0
        for c in t {
            ans += Int(c.asciiValue!)
        }
        for c in s {
            ans -= Int(c.asciiValue!)
        }
        return Character(UnicodeScalar(ans)!)
    }
}

let res = Solution().findTheDifference("abc", "abcd")
let res1 = Solution().findTheDifference("", "t")
