//: [Previous](@previous)

import Foundation

extension Solution {
    ///`BFS`
    ///Time complexity `O(n + m)` which n is tree size & m is total tree levels
    ///Space complexity `O(n + m + p)` which n is queue size, m is array of nodes when traversal and p is output
    func levelOrderBottom(_ root: TreeNode?) -> [[Int]] {
        var queue = [(root, 1)]
        var nodes: [[Int]] = []
        
        while !queue.isEmpty {
            let (node, level) = queue.removeFirst()
            if let val = node?.val {
                if nodes.count < level {
                    nodes.append([val])
                } else {
                    var curr = nodes[level - 1]
                    curr.append(val)
                    nodes[level - 1] = curr
                }
            }
            
            if node?.left != nil {
                queue.append((node?.left, level + 1))
            }
            if node?.right != nil {
                queue.append((node?.right, level + 1))
            }
        }
        
        var res: [[Int]] = []
        for i in stride(from: nodes.count - 1, through: 0, by: -1) {
            res.append(nodes[i])
        }
        return res
    }
}

let root: TreeNode? = .init(3,
                            .init(9),
                            .init(20, .init(15), .init(7)))
let result = Solution().levelOrderBottom(root)

//: [Next](@next)
