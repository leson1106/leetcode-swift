//: [Previous](@previous)

import Foundation

extension Solution {
    ///`BFS`
    func isSymmetric(_ root: TreeNode?) -> Bool {
        var queue = [root]
        while !queue.isEmpty {
            let left: TreeNode?
            let right: TreeNode?
            
            //from root
            if queue.count == 1 {
                let current = queue.removeFirst()
                left = current?.left
                right = current?.right
            }
            //others
            else {
                left = queue.removeFirst()
                right = queue.removeFirst()
            }
            
            if left == nil && right == nil {
                continue
            }
            
            if left == nil || right == nil {
                return false
            }
            
            if let lVal = left?.val, let rVal = right?.val, lVal != rVal {
                return false
            }
            
            queue.append(left?.left)
            queue.append(right?.right)
            
            queue.append(left?.right)
            queue.append(right?.left)
        }
        
        return true
    }
    
    ///`DFS`
    func isSymmetric(_ root: TreeNode?) -> Bool {
        return false
    }
}

let root: TreeNode? = .init(1,
                            .init(2, .init(3), .init(4)),
                            .init(2, .init(1), .init(4)))
let result = Solution().isSymmetric(root)
//: [Next](@next)
