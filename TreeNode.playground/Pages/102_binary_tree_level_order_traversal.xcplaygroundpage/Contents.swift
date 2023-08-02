//: [Previous](@previous)

import Foundation

extension Solution {
    ///`BFS`
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        var queue = [root]
        var result: [[Int]] = []
        var element: [Int] = []
        
        var leafCount: Int = 0
        var parentCount: Int = 1 //default is only root
        
        while !queue.isEmpty {
            let curr = queue.removeFirst()
            
            if let left = curr?.left {
                queue.append(left)
                leafCount += 1
            }
            if let right = curr?.right {
                queue.append(right)
                leafCount += 1
            }
            
            if let val = curr?.val {
                element.append(val)
            }
            if element.count == parentCount {
                result.append(element)
                element = []
                parentCount = leafCount
                leafCount = 0
            }
        }
        
        return result
    }
}

let root: TreeNode? = .init(3,
                            .init(9, .init(4), .init(6)),
                            .init(20, .init(15), .init(7)))
let result = Solution().levelOrder(root)
print(result)

//: [Next](@next)
