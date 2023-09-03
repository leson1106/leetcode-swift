//: [Previous](@previous)

import Foundation

class Solution {
    ///`BFS`
    func sumOfLeftLeaves(_ root: TreeNode?) -> Int {
        var sum: Int = 0
        
        var queue = [(root, false)]
        
        while !queue.isEmpty {
            let (node, isLeft) = queue.removeFirst()
            
            if node?.left == nil && node?.right == nil && isLeft {
                sum += node!.val
            }
            
            if node?.left != nil {
                queue.append((node?.left, true))
            }
            if node?.right != nil {
                queue.append((node?.right, false))
            }
        }
        
        return sum
    }
    
    ///`DFS`
    func sumOfLeftLeaves2(_ root: TreeNode?) -> Int {
        guard root != nil else { return 0 }
        var sum = 0
        if let left = root?.left, left.left == nil, left.right == nil {
            sum += left.val
        }
        return sum + sumOfLeftLeaves2(root?.left ?? nil) + sumOfLeftLeaves2(root?.right ?? nil)
    }
}

let root: TreeNode? = .init(3,
                            .init(9),
                            .init(20, .init(15), .init(7)))
let result = Solution().sumOfLeftLeaves2(root)

//: [Next](@next)
