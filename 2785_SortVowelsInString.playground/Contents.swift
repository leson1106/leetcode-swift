import UIKit

class Solution {
    ///Time complexity `O(n logn)`
    ///Space complexity `O(m)` where m is length of total vowels in string
    func sortVowels(_ s: String) -> String {
        var s = s.map { String($0) }
        var vowelsArray = [String]()
        let vowels: [String] = ["a", "e", "i", "o", "u"]
        for c in s where vowels.contains(c.lowercased()) {
            vowelsArray.append(c)
        }
        
        vowelsArray.sort()
        var currIndex = 0
        for i in 0..<s.count {
            if vowels.contains(s[i].lowercased()) {
                s[i] = vowelsArray[currIndex]
                currIndex += 1
            }
        }
        return s.joined()
    }
}

let res = Solution().sortVowels("lEetcOde")
let res1 = Solution().sortVowels("lYmpH")
