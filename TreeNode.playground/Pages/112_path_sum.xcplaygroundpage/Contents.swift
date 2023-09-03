//: [Previous](@previous)

import Foundation

extension Solution {
    ///`BFS`
    func hasPathSum(_ root: TreeNode?, _ targetSum: Int) -> Bool {
        guard root != nil else { return false }
        
        var queue = [(root, targetSum)]
        
        while !queue.isEmpty {
            let (node, leftOverVal) = queue.removeFirst()
            
            //Return true if valid branch, no need to iterate more elements in queue
            if leftOverVal - node!.val == 0 && node?.left == nil && node?.right == nil { return true }
            
            if node?.left != nil {
                queue.append((node?.left, leftOverVal - node!.val))
            }
            if node?.right != nil {
                queue.append((node?.right, leftOverVal - node!.val))
            }
        }
        
        return false
    }
    
    ///`DFS`
    func hasPathSum2(_ root: TreeNode?, _ targetSum: Int) -> Bool {
        guard let root = root else { return false }
        
        if root.val == targetSum && root.left == nil && root.right == nil { return true }
        
        return hasPathSum(root.left, targetSum - root.val) || hasPathSum(root.right, targetSum - root.val)
    }
}

let root: TreeNode? = .init(5,
                            .init(4, .init(11, .init(7), .init(2)), nil),
                            .init(8, .init(13), .init(4, nil, .init(1))))

let root2: TreeNode? = .init(1, .init(2), .init(3))
let root3: TreeNode? = nil
let root4: TreeNode? = .init(-2, nil, .init(-3))

let result = Solution().hasPathSum(root, 22)
let result2 = Solution().hasPathSum(root2, 5)
let result3 = Solution().hasPathSum(root3, 0)
let result4 = Solution().hasPathSum(root4, -5)

//: [Next](@next)
