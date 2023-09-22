//: [Previous](@previous)

import Foundation
import UIKit

extension Solution {
    ///`BFS`
    func rightSideView(_ root: TreeNode?) -> [Int] {
        guard root != nil else { return [] }
        var queue = [root]
        var res = [Int]()
        
        while !queue.isEmpty {
            let count = queue.count
            for i in 0..<count {
                let node = queue.removeFirst()
                
                if i == count - 1 {
                    res.append(node!.val)
                }
                
                if let left = node?.left {
                    queue.append(left)
                }
                if let right = node?.right {
                    queue.append(right)
                }
            }
        }
        return res
    }
    
    ///`DFS`
    func rightSideView2(_ root: TreeNode?) -> [Int] {
        func dfs(_ r: TreeNode?, _ level: Int, _ res: inout [Int]) {
            guard let r = r else { return }
            if level >= res.count {
                res.append(r.val)
            } else {
                res[level] = r.val
            }
            dfs(r.left, level + 1, &res)
            dfs(r.right, level + 1, &res)
        }
        
        var res: [Int] = []
        dfs(root, 0, &res)
        return res
    }
}

let root: TreeNode? = .init(1, .init(2, nil, .init(5)), .init(3, nil, .init(4)))
let root1: TreeNode? = .init(1, .init(2), nil)
let root2: TreeNode? = .init(3, .init(9, .init(11), nil), .init(20))
let result = Solution().rightSideView2(root)
let result1 = Solution().rightSideView2(root1)
let result2 = Solution().rightSideView2(root2)

//: [Next](@next)
