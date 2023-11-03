//: [Previous](@previous)

import Foundation

extension Solution {
    ///Iteration, in order
    func isValidBST(_ root: TreeNode?) -> Bool {
        guard root != nil else { return false }
        var stack = [TreeNode?]()
        var prev: TreeNode?
        var node = root
        
        while node != nil || !stack.isEmpty {
            while node != nil {
                stack.append(node)
                node = node?.left
            }
            node = stack.removeLast()
            if let prev = prev?.val, let val = node?.val, val <= prev {
                return false
            }
            prev = node
            node = node?.right
        }
        return true
    }
    
    ///Recursion, in order
    private var prevNode: Int?
    func isValidBST2(_ root: TreeNode?) -> Bool {
        traversal(root)
    }
    
    private func traversal(_ root: TreeNode?) -> Bool {
        guard let root = root else { return true }
        
        guard traversal(root.left) else { return false }
        
        if let prevNode = prevNode, root.val <= prevNode { return false }
        prevNode = root.val
        
        return traversal(root.right)
    }
}

//: [Next](@next)
