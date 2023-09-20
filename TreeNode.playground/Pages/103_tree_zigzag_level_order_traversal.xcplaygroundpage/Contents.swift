//: [Previous](@previous)

import Foundation

extension Solution {
    private enum State {
        case left2Right
        case right2Left
    }
    
    ///`BFS`
    ///Time complexity `O(n)` where n is total nodes, each node appears one time
    ///Space complexity `O(n + m)`
    func zigzagLevelOrder(_ root: TreeNode?) -> [[Int]] {
        guard root != nil else { return [] }
        
        var queue: [(TreeNode?, State)] = [(root, .left2Right)]
        var result = [[Int]]()
        
        while !queue.isEmpty {
            let count = queue.count
            var element = [Int]()
            
            for _ in 0..<count {
                let (node, state) = queue.removeFirst()
                if state == .left2Right {
                    element.append(node!.val)
                } else {
                    element.insert(node!.val, at: 0)
                }
                let nextState: State = state == .left2Right ? .right2Left : .left2Right
                if let left = node?.left {
                    queue.append((left, nextState))
                }
                if let right = node?.right {
                    queue.append((right, nextState))
                }
            }
            result.append(element)
        }
        
        return result
    }
}

let root: TreeNode? = .init(3, .init(9), .init(20, .init(15), .init(7)))
let root1: TreeNode? = .init(1)
let result = Solution().zigzagLevelOrder(root)
let result1 = Solution().zigzagLevelOrder(root1)
let result2 = Solution().zigzagLevelOrder(nil)

//: [Next](@next)
