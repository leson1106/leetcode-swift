import UIKit

//https://leetcode.com/problems/find-common-characters
class Solution {
    ///Time complexity `O(n * m)`
    ///Space complexity `O(1)` ignore `res` and `max characters are 26` (constant)
    func commonChars(_ words: [String]) -> [String] {
        var common: [Character: Int] = [:]
        var res = [String]()
        //["bella","label","roller"]
        //1st common = [b:1, e:1, l:2, a:1]
        //2st common = [b:1, e:1, l:2, a:1]
        //3st common = [r:1, o:1, l:2, e:1, r:1]

        for c in words[0] {
            common[c, default: 0] += 1
        }
        for i in 1..<words.count {
            var map: [Character: Int] = [:]

            for c in words[i] {
                map[c, default: 0] += 1
            }

            //Compare map with common to determine newCommon then replace with common
            //bella vs roller -> [e: 1, l: 2], ignore others
            var newCommon: [Character: Int] = [:]
            for (c, freq) in common {
                if let currentFreq = map[c] {
                    newCommon[c] = min(freq, currentFreq)
                }
            }
            common = newCommon
        }

        for (c, freq) in common {
            for i in 0..<freq {
                res.append(String(c))
            }
        }

        return res
    }
}

let res = Solution().commonChars(["bella","label","roller"]) //e, l, l
print(res)
let res1 = Solution().commonChars(["cool","lock","cook"]) //c, o
print(res1)
