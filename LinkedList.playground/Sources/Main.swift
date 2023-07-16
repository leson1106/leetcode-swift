import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

public class Solution {
    public init() { }
}

public func printNode(_ node: ListNode?) {
    print(node?.val)
    var node = node?.next
    if node != nil {
        printNode(node)
    } else {
        return
    }
}
