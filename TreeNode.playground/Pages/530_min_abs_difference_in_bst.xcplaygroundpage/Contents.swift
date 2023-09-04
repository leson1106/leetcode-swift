//: [Previous](@previous)

import Foundation

class Solution {
    ///Time complexity `O(2n)` which n is total tree nodes
    ///Space complexity `O(2n)` which n is queue size & result size, both equal to total tree nodes
    ///`BFS`
    func getMinimumDifference(_ root: TreeNode?) -> Int {
        var queue = [root]
        var result: [Int] = []
        
        while !queue.isEmpty {
            let node = queue.removeFirst()
            result.append(node!.val)
            
            if let left = node?.left {
                queue.append(left)
            }
            if let right = node?.right {
                queue.append(right)
            }
        }
        
        var res: Int = .max
        result.sort()
        for i in 0..<result.count - 1 {
            res = min(abs(result[i] - result[i + 1]), res)
        }
        
        return res
    }
    
    private var minVal: Int = .max
    private var prevVal: Int?
    
    ///`DFS`
    func getMinimumDifference2(_ root: TreeNode?) -> Int {
        guard root != nil else { return minVal }
        
        getMinimumDifference2(root?.left)
        
        if let _prev = prevVal {
            minVal = min(minVal, root!.val - _prev)
        }
        prevVal = root?.val
        
        getMinimumDifference2(root?.right)
        
        return minVal
    }
}

let root1: TreeNode? = .init(4,
    .init(2, .init(1), .init(3)),
    .init(6))
let root2: TreeNode? = .init(1,
    .init(0),
    .init(48, .init(12), .init(49)))
let root3: TreeNode? = .init(236,
    .init(104, nil, .init(227)),
    .init(701, nil, .init(911)))

let result1 = Solution().getMinimumDifference2(root1)
//let result2 = Solution().getMinimumDifference(root2)
//let result3 = Solution().getMinimumDifference(root3)

//: [Next](@next)
