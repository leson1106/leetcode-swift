//: [Previous](@previous)

import Foundation

/*
 Given the head of a sorted linked list, delete all duplicates such that each element appears only once. Return the linked list sorted as well.
 1->1->2 ==> 1->2
 1->2->2->3->3 ==> 1->2->3
 */
extension Solution {
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        guard head?.next != nil else { return head }
        
        var pointer = head
        
        while pointer?.next != nil {
            if pointer!.val == pointer!.next!.val {
                pointer?.next = pointer?.next?.next
            } else {
                pointer = pointer?.next
            }
        }
        
        return head
    }
}

var list1: ListNode? = ListNode(1, .init(1, .init(2, nil)))
var list2: ListNode? = ListNode(1, .init(2, .init(2, .init(3, .init(3, nil)))))
//let result = Solution().deleteDuplicates(list1)

func addTailNote(_ node: ListNode?, in list: ListNode?) {
    var pointer = list
    while pointer?.next != nil {
        pointer = pointer?.next
    }
    pointer?.next = node
}
//addTailNote(.init(4), in: list2)
//printNode(list2)

func addHeadNote(_ node: ListNode?, in list: inout ListNode?) {
    node?.next = list
    list = node
}
//addHeadNote(.init(0), in: &list1)
//printNode(list1)

while list1?.next != nil {
    let tmp = list1?.next
    print(tmp?.val)
    list1 = tmp
}
printNode(list1)

//: [Next](@next)
