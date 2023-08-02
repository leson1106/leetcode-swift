//: [Previous](@previous)

import Foundation

extension Solution {
    func maxDepth(_ root: TreeNode?) -> Int {
        guard root != nil else { return 0 }
        
        var count: Int = 1
        var queue = [root]
        
        while !queue.isEmpty {
            let node = queue.removeFirst()
            count += 1
            
            if node?.left != nil && node?.right != nil {
                count -= 1
            }
            if node?.left != nil {
                queue.append(node?.left)
            }
            if node?.right != nil {
                queue.append(node?.right)
            }
        }
        
        return count
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
