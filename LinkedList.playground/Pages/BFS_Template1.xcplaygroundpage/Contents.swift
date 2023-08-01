//: [Previous](@previous)

import Foundation

func bfs(root: ListNode?, target: ListNode?) -> Int? {
    let queue = NodeQueue()
    var step = 0
    
    guard let root = root else { return nil }
    queue.enqueue(node: root)
    
    while !queue.isEmpty {
        let size = queue.size
        
        for i in 0..<size {
            var current = queue.dequeue()
            if current == target { return step }
            
            while current?.next != nil {
                queue.enqueue(node: current?.next)
                current = current?.next
            }
            queue.dequeue()
        }
        step += 1
    }
    return step
}

//let root: ListNode? = .init(1, .init(2, .init(3, .init(4, .init(5, nil)))))
//let target: ListNode? = .init(5, nil)
//let result = bfs(root: root, target: target)

//: [Next](@next)
