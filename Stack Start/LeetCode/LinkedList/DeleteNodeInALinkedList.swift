import Foundation

class SolutionLinkedListC {
    func deleteNode(_ node: ListNode?) {
        guard let nextNode = node?.next else {
            return
        }
        
        node?.val = nextNode.val
        node?.next = nextNode.next
    }
}
