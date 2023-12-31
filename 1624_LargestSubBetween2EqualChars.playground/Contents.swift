import UIKit

class Solution {
    ///Time complexity `O(n)` iterating over s length
    ///Space complexity `O(n)` in worst case is map size
    func maxLengthBetweenEqualCharacters(_ s: String) -> Int {
        var map: [Character: Int] = [:] //<Char: Index>
        let s = Array(s)
        var res = -1
        for i in 0..<s.count {
            if let index = map[s[i]] {
                //Minus current element
                res = max(res, i - index - 1)
            } else {
                map[s[i]] = i
            }
        }
        return res
    }
}

let res = Solution().maxLengthBetweenEqualCharacters("aa") //0
let res1 = Solution().maxLengthBetweenEqualCharacters("abca") //2
let res2 = Solution().maxLengthBetweenEqualCharacters("cbzxy") //-1
