import Foundation

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

public class Solution {
    public init() { }
}

///Print with breath-first from left -> right
public func printTree(_ root: TreeNode?) {
    var queue = [root]
    var result: String = ""
    while !queue.isEmpty {
        let node = queue.removeFirst()
        let val: String = node?.val == nil ? "nil" : String(node!.val)
        result += "\(val) -> "
        if node?.left != nil {
            queue.append(node?.left)
        }
        if node?.right != nil {
            queue.append(node?.right)
        }
    }
    print(result)
}

public class Node {
    public var val: Int
    public var left: Node?
    public var right: Node?
    public var next: Node?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
        self.next = nil
    }
}
