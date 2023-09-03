//: [Previous](@previous)

import Foundation

extension Solution {
    ///`BFS`
    func invertTree(_ root: TreeNode?) -> TreeNode? {
        var queue = [root]
        
        while !queue.isEmpty {
            let node = queue.removeFirst()
            
            let leftTemp = node?.left
            node?.left = node?.right
            node?.right = leftTemp
            
            if node?.left != nil {
                queue.append(node?.left)
            }
            if node?.right != nil {
                queue.append(node?.right)
            }
        }
        
        return root
    }
    
    ///`DFS`
    func invertTree2(_ root: TreeNode?) -> TreeNode? {
        let left = root?.left
        root?.left = invertTree2(root?.right)
        root?.right = invertTree2(left)
        return root
    }
}

let root: TreeNode? = .init(4,
                            .init(2, .init(1), .init(3)),
                            .init(7, .init(6), .init(9)))
let result = Solution().invertTree(root)
let result2 = Solution().invertTree2(root)
printTree(result)
printTree(result2)

//: [Next](@next)
