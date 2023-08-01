//: [Previous](@previous)

import Foundation

extension Solution {
    ///Time `O(n)` cause need to traversal all tree nodes
    ///Space `O(n)` cause in worst case, the queue have to store all nodes
    ///`BFS`
    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        var queue = [p, q]
        var p = p
        var q = q
        while !queue.isEmpty {
            p = queue.removeFirst()
            q = queue.removeFirst()
            
            if p == nil && q == nil { continue }
            if p == nil || q == nil { return false }
            if let pVal = p?.val, let qVal = q?.val, pVal != qVal { return false }
            
            queue.append(p!.left)
            queue.append(q!.left)
            
            queue.append(p!.right)
            queue.append(q!.right)
        }
        
        return true
    }
    
    ///`DFS`
    func isSameTree2(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        if p == nil && q == nil { return true }
        if p == nil || q == nil { return false }
        return isSameTree2(p?.left, q?.left) && isSameTree2(p?.right, q?.right) && p?.val == q?.val
    }
}

let q: TreeNode? = .init(1, .init(2), .init(3))
let p: TreeNode? = .init(1, .init(2), .init(3))
//let q: TreeNode? = .init(1, .init(2), nil)
//let p: TreeNode? = .init(1, nil, .init(2))
//let q: TreeNode? = .init(1, .init(2), .init(1))
//let p: TreeNode? = .init(1, .init(1), .init(2))
//let result1 = Solution().isSameTree(p, q)
let result2 = Solution().isSameTree2(p, q)
//: [Next](@next)
