import UIKit

///All methods shoud be implemented with constant time `O(1)`
class MinStack {
    private struct StackELement {
        var val: Int
        var min: Int
    }
    
    private var stack: [StackELement]
    
    init() {
        stack = [StackELement]()
    }
    
    func push(_ val: Int) {
        if !stack.isEmpty {
            stack.append(.init(val: val, min: min(val, stack[stack.count - 1].min)))
        } else {
            stack.append(.init(val: val, min: val))
        }
    }
    
    func pop() {
        guard !stack.isEmpty else { return }
        _ = stack.removeLast()
    }
    
    func top() -> Int {
        guard let top = stack.last else { return 0 }
        return top.val
    }
    
    func getMin() -> Int {
        guard !stack.isEmpty else { return 0 }
        return stack.last!.min
    }
}
