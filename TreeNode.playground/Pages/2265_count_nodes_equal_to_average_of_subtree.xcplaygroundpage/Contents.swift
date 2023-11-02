//: [Previous](@previous)

import Foundation

extension Solution {
    func averageOfSubtree(_ root: TreeNode?) -> Int {
        var count = 0
        _ = postOrder(root, &count)
        return count
    }
    
    func postOrder(_ root: TreeNode?, _ count: inout Int) -> (Int, Int) {
        guard root != nil else { return (0,0) }
        let left = postOrder(root?.left, &count)
        let right = postOrder(root?.right, &count)
        
        let nodeSum = left.0 + right.0 + (root?.val ?? 0)
        let nodeCount = left.1 + right.1 + 1
        let average = nodeSum / nodeCount
        
        if let val = root?.val, val == average {
            count += 1
        }
        return (nodeSum, nodeCount)
    }
}

//: [Next](@next)
