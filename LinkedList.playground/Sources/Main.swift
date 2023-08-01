import Foundation

public final class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

extension ListNode: Equatable {
    public static func == (lhs: ListNode, rhs: ListNode) -> Bool {
        lhs.val == rhs.val
    }
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

public class NodeQueue {
    
    private var head: ListNode?
    private var tail: ListNode?
    private var _size: Int = 0
    
    public init() { }
    
    public func enqueue(node: ListNode?) {
        guard let node = node else { return }
        if tail == nil {
            head = node
            tail = node
        } else {
            tail?.next = node
            tail = node
        }
        _size += 1
    }
    
    @discardableResult
    public func dequeue() -> ListNode? {
        if let val = head?.val {
            head = head?.next
            if head == nil { tail = nil }
            _size -= 1
            return ListNode(val)
        } else {
            return nil
        }
    }
    
    public var isEmpty: Bool {
        _size == 0
    }
    
    public var isHeadNil: Bool {
        head == nil
    }
    
    public var isTailNil: Bool {
        tail == nil
    }
    
    public var size: Int {
        _size
    }
    
    public func printQueue() {
        var temp = head
        var str = ""
        while temp != nil {
            str += ("\(temp!.val)->")
            temp = temp?.next
        }
        print(str)
    }
}
