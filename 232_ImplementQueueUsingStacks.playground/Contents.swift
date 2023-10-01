import UIKit

class MyQueue {
    
    private var stack1: [Int] = []
    private var stack2: [Int] = []
    private var frontVal: Int = 0
    
    init() { }
    
    ///Time complexity `O(1)`
    ///Space complexity `O(n)` to store data in stack1
    func push(_ x: Int) {
        if stack1.isEmpty {
            frontVal = x
        }
        stack1.append(x)
    }
    
    ///Time complexity  `O(1)` amortized, `O(n)` worst case to transfer element from stack2 to stack 2
    ///Space complexity  `O(1)` cause size of stack is still the same, no need additional space
    func pop() -> Int {
        if stack2.isEmpty {
            while !stack1.isEmpty {
                stack2.append(stack1.removeLast())
            }
            return stack2.removeLast()
        } else {
            return stack2.removeLast()
        }
    }
    
    ///Time complexity  `O(1)`
    ///Space complexity  `O(1)`
    func peek() -> Int {
        if !stack2.isEmpty {
            return stack2[stack2.count - 1]
        } else {
            return frontVal
        }
    }
    
    ///Time complexity  `O(1)`
    ///Space complexity  `O(1)`
    func empty() -> Bool {
        stack1.isEmpty && stack2.isEmpty
    }
}
