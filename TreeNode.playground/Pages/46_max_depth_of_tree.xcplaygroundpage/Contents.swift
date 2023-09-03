//: [Previous](@previous)

import Foundation

extension Solution {
    ///Time complexity `O(n)` which n is children nodes
    ///Space complexity `O(n)` is size of queue, in worst case is all tree nodes
    ///`BFS`
    func maxDepth(_ root: TreeNode?) -> Int {
        guard root != nil else { return 0 }
        
        var count: Int = 0
        var queue = [(root, 1)]
        
        while !queue.isEmpty {
            let (node, depth) = queue.removeFirst()
            count = max(count, depth)
            if node?.left != nil {
                queue.append((node?.left, depth + 1))
            }
            if node?.right != nil {
                queue.append((node?.right, depth + 1))
            }
        }
        
        return count
    }
    
    ///`DFS`
    func maxDepth2(_ root: TreeNode?) -> Int {
        root == nil ? 0 : max(maxDepth2(root?.left), maxDepth2(root?.right)) + 1
    }
}

//let root: TreeNode? = .init(3,
//    .init(9, nil, nil),
//    .init(20, .init(15), .init(7)))
//let root: TreeNode? = .init(1, nil, .init(2))
//let root: TreeNode? = .init(1,
//                            .init(2, .init(4), nil),
//                            .init(3, nil, .init(5)))
let root: TreeNode? = .init(3,
                            .init(9, nil, nil),
                            .init(20, .init(15), .init(7)))
let result = Solution().maxDepth(root)
//: [Next](@next)
