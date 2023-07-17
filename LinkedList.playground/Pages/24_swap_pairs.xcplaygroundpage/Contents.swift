//: [Previous](@previous)

import Foundation

extension Solution {
    func swapPairs(_ head: ListNode?) -> ListNode? {
        var list: ListNode? = ListNode(-1)
        list?.next = head
        let temp = list
        
        while list?.next?.next != nil {
            let temp1 = list?.next?.next
            let temp2 = list?.next
            list?.next = temp1
            temp2?.next = temp1?.next
            temp1?.next = temp2
            
            list = temp2
        }
        
        return temp?.next
    }
}

let list: ListNode? = .init(1, .init(2, .init(3, .init(4))))
let result = Solution().swapPairs(list)
printNode(result)

//: [Next](@next)
