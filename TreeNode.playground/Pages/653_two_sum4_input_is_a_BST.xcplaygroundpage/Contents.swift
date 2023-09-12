//: [Previous](@previous)

import Foundation

extension Solution {
    ///Time complexity `O(n * n)`
    ///Space complexity `O(n + m)`
    ///`BFS`
    func findTarget(_ root: TreeNode?, _ k: Int) -> Bool {
        var nodesVal: [Int] = []
        var queue = [root]
        
        while !queue.isEmpty {
            let node = queue.removeFirst()
            for val in nodesVal where node!.val + val == k {
                return true
            }
            nodesVal.append(node!.val)
            
            if let left = node?.left    { queue.append(left) }
            if let right = node?.right  { queue.append(right) }
        }
        
        return false
    }
}

//: [Next](@next)
