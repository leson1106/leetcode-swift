//: [Previous](@previous)

import Foundation

extension Solution {
    func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
        var dummy: ListNode? = ListNode(-1, head)
        var current = dummy
        
        while let _val = current?.next?.val {
            if _val == val {
                current?.next = current?.next?.next
            } else {
                current = current?.next
            }
        }
        return dummy?.next
    }
    
    func removeElements2(_ head: ListNode?, _ val: Int) -> ListNode? {
        if head == nil { return head }
        
        let node: ListNode? = removeElements2(head?.next, val)
        
        if head?.val == val {
            return node
        } else {
            head?.next = node
            return head
        }
    }
}

let list: ListNode? = .init(1, .init(2, .init(6, .init(3, .init(4, .init(5, .init(6)))))))
//let list: ListNode? = .init(7, .init(7, .init(7)))
let result = Solution().removeElements(list, 7)
printNode(result)

//: [Next](@next)
