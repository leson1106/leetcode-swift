//: [Previous](@previous)

import Foundation

extension Solution {
    
    ///`BFS`
    func isCousins(_ root: TreeNode?, _ x: Int, _ y: Int) -> Bool {
        var queue: [(TreeNode?, Int?, Int)] = [(root, nil, 1)]
        var xLevel: (Int, Int?) = (-1, nil)
        var yLevel: (Int, Int?) = (-1, nil)
        
        while !queue.isEmpty {
            let (node, prevVal, level) = queue.removeFirst()
            
            if let val = node?.val, x == val || y == val {
                if x == val {
                    xLevel = (level, prevVal)
                } else {
                    yLevel = (level, prevVal)
                }
            }
            
            if xLevel.0 != -1 && yLevel.0 != -1 {
                return (xLevel.0 == yLevel.0) && (xLevel.1 != yLevel.1)
            }
            
            if let left = node?.left {
                queue.append((left, node?.val, level + 1))
            }
            if let right = node?.right {
                queue.append((right, node?.val, level + 1))
            }
        }
        
        return false
    }
}

let root: TreeNode? = .init(1, .init(2, .init(4), nil), .init(3))
let root1: TreeNode? = .init(1, .init(2, nil, .init(4)), .init(3, nil, .init(5)))
let root2: TreeNode? = .init(1, .init(2, nil, .init(4)), .init(3))
let result1 = Solution().isCousins(root, 4, 3)
let result2 = Solution().isCousins(root1, 5, 4)
let result3 = Solution().isCousins(root2, 2, 3)

//: [Next](@next)
