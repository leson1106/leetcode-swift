//: [Previous](@previous)

import Foundation

extension Solution {
    ///`BFS`
    func averageOfLevels(_ root: TreeNode?) -> [Double] {
        var queue: [TreeNode?] = [root]
        var res: [Double] = []
        
        while !queue.isEmpty {
            var level = queue.count
            var sum: Double = 0
            var i: Int = 0
            while i < level {
                let node = queue.removeFirst()
                sum += Double(node!.val)
                
                if node?.left != nil {
                    queue.append(node?.left)
                }
                if node?.right != nil {
                    queue.append(node?.right)
                }
                i += 1
            }
            res.append(sum/Double(level))
        }
        return res
    }
}

let root: TreeNode? = .init(3,
                            .init(9),
                            .init(20, .init(15), .init(7)))
let result = Solution().averageOfLevels(root)

//: [Next](@next)
