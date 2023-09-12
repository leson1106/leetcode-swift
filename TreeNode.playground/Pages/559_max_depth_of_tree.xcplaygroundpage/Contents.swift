//: [Previous](@previous)

import Foundation

public class Node {
    public var val: Int
    public var children: [Node]
    public init(_ val: Int) {
        self.val = val
        self.children = []
    }
}

extension Solution {
    ///Time complexity `O(n)`
    ///Space complexity `O(n)`
    ///`BFS`
    func maxDepth(_ root: Node?) -> Int {
        guard root != nil else { return 0 }
        
        var queue = [(root, 1)]
        var res: Int = 0
        
        while !queue.isEmpty {
            let (node, level) = queue.removeFirst()
            
            for child in node!.children {
                queue.append((child, level + 1))
            }
            
            res = level
        }
        
        return res
    }
    
    ///TIme complexity `O(n)`
    ///Space complexity `O(1)`
    ///`DFS`
    func maxDepth2(_ root: Node?) -> Int {
        guard root != nil else { return 0 }
        
        var level: Int = 0
        root?.children.forEach {
            level = max(level, maxDepth2($0))
        }
        return level + 1
    }
}

let child = Node(3)
child.children = [.init(5), .init(6)]
let root = Node(1)
root.children = [child, .init(2), .init(4)]
let result = Solution().maxDepth2(root)

//: [Next](@next)
