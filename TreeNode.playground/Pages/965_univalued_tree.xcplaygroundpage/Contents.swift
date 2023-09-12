//: [Previous](@previous)

import Foundation

extension Solution {
    ///`BFS`
    func isUnivalTree(_ root: TreeNode?) -> Bool {
        var queue = [root]
        while !queue.isEmpty {
            let node = queue.removeFirst()
            
            if let left = node?.left {
                if left.val != node?.val {
                    return false
                }
                queue.append(left)
            }
            if let right = node?.right {
                if right.val != node?.val {
                    return false
                }
                queue.append(right)
            }
        }
        return true
    }
}

//: [Next](@next)
