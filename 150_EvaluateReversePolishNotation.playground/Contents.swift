import UIKit

class Solution {
    ///You are given an array of strings tokens that represents an arithmetic expression in a Reverse Polish Notation.
    ///Evaluate the expression. Return an integer that represents the value of the expression.
    ///
    ///     Input: tokens = ["10","6","9","3","+","-11","*","/","*","17","+","5","+"]
    ///     Output: 22
    ///     Explanation: ((10 * (6 / ((9 + 3) * -11))) + 17) + 5
    ///     = ((10 * (6 / (12 * -11))) + 17) + 5
    ///     = ((10 * (6 / -132)) + 17) + 5
    ///     = ((10 * 0) + 17) + 5
    ///     = (0 + 17) + 5
    ///     = 17 + 5
    ///     = 22
    ///
    ///Time complexity `O(n)`
    ///Space complexity `O(n)`
    func evalRPN(_ tokens: [String]) -> Int {
        guard tokens.count > 2 else { return Int(tokens[0])! }
        var stack: [Int] = []
        var res: Int = 0
        let set: Set<String> = ["+", "-", "*", "/"]
        
        for t in tokens {
            if set.contains(t) && !stack.isEmpty {
                let v2 = stack.removeLast()
                let v1 = stack.removeLast()
                let r: Int?
                switch t {
                case "+": r = v1 + v2
                case "-": r = v1 - v2
                case "*": r = v1 * v2
                case "/": r = v1 / v2
                default : r = nil
                }
                if let _r = r {
                    res = _r
                    stack.append(_r)
                }
            } else {
                stack.append(Int(t)!)
            }
        }
        return res
    }
}

let res = Solution().evalRPN(["2","1","+","3","*"])
let res1 = Solution().evalRPN(["4","13","5","/","+"])
let res2 = Solution().evalRPN(["10","6","9","3","+","-11","*","/","*","17","+","5","+"])
