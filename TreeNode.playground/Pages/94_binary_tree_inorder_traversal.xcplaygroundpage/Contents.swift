//: [Previous](@previous)

import Foundation

extension Solution {
    ///Traversal in depth with stack instead of recursion -> `Iterating tree using stack`
    ///Time complexity `O(n)` cause each note just be visited once
    ///Space complexity `O(n)`
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        guard root != nil else { return [] }
        var stack: [TreeNode?] = []
        var curr: TreeNode? = root
        var res = [Int]()
        
        while !stack.isEmpty || curr != nil {
            while curr != nil {
                stack.append(curr)
                curr = curr?.left
            }
            curr = stack.removeLast()
            res.append(curr!.val)
            curr = curr?.right
        }
        return res
    }
    
    ///`Normal DFS`
    func inorderTraversal2(_ root: TreeNode?) -> [Int] {
        var result: [Int] = []
        
        func traversal(_ node: TreeNode?) {
            guard node != nil else { return }
            traversal(node?.left)
            if let val = node?.val {
                result.append(val)
            }
            traversal(node?.right)
        }
        
        traversal(root)
        
        return result
    }
}

let root = TreeNode(1, nil, .init(2, .init(3), nil))
let root1 = TreeNode(1,
                     .init(2, .init(4), .init(5)),
                     .init(3, .init(6), nil))
let res = Solution().inorderTraversal2(root)
let res1 = Solution().inorderTraversal2(root1)

//: [Next](@next)
