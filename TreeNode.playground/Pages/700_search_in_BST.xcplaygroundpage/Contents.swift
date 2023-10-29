//: [Previous](@previous)

import Foundation

extension Solution {
    ///Time complexity `O(n)` cause each node just visits one time
    ///Space complexity `O(n)` recursion stack, n is depth of tree
    ///In-order traversal in BST is already sorted, so searching from left to right
    func searchBST(_ root: TreeNode?, _ val: Int) -> TreeNode? {
        guard root != nil else { return nil }
        guard let value = root?.val else { return nil }
        if value == val {
            return root
        } else if value < val {
            return searchBST(root?.right, val)
        } else {
            return searchBST(root?.left, val)
        }
    }
}

//: [Next](@next)
