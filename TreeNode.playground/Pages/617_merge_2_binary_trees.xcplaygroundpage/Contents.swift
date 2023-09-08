//: [Previous](@previous)

import Foundation

extension Solution {
    ///`DFS`
    func mergeTrees(_ root1: TreeNode?, _ root2: TreeNode?) -> TreeNode? {
        if root1 == nil { return root2 }
        if root2 == nil { return root1 }
        root1?.val += root2?.val ?? 0
        root1?.left = mergeTrees(root1?.left, root2?.left)
        root1?.right = mergeTrees(root1?.right, root2?.right)
        return root1
    }
}

let root1: TreeNode? = .init(1)
let root2: TreeNode? = .init(1, .init(2), nil)
let result = Solution().mergeTrees(root1, root2)
printTree(result)
//: [Next](@next)
