import UIKit

class Solution {
    private var cache: [Int: Int] = [:]
    
    ///Fibonacci with memoi
    ///Time complexity `O(2^n)` cause every steps will split into 2 steps. However, it's become `O(n)` with memoi
    ///Space Complexity `O(m + k)` with memoi, m is depth, k is map size
    func fib(_ n: Int) -> Int {
        if let num = cache[n] {
            return num
        }
        if n > 1 {
            let i = fib(n-1)
            cache[n-1] = i
            let j = fib(n-2)
            cache[n-2] = j
            return i + j
        } else {
            return n == 0 ? 0 : 1
        }
    }
    
    func climbStairs(_ n: Int) -> Int {
        if let num = cache[n] {
            return num
        }
        if n > 1 {
            let i = climbStairs(n-1)
            cache[n-1] = i
            let j = climbStairs(n-2)
            cache[n-2] = j
            return i + j
        } else {
            return 1
        }
    }
}
