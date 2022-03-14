import Foundation


// MARK: - Binary Node 구현
class BinaryNode<Element> {
    var value: Element // 모든 Node는 Value를 가지고 있다.
    var leftChild: BinaryNode?
    var rightChild: BinaryNode? // 2개의 자식 노드를 가지기 때문에 2개 변수 생성
    
    init(value: Element) {
        self.value = value
    }
}

extension BinaryNode {
    // MARK: - In-order Traversal
    func traverseInOrder(visit: (Element) -> Void) { // 다시 어떻게 올라오는거지...?
        leftChild?.traverseInOrder(visit: visit) // left child 끝까지 재귀함수를 통해 가서 0을 언제 append 하는 거지
        visit(value) // 그 값을 클로저에 정의한대로 처리
        rightChild?.traverseInOrder(visit: visit) // 마지막에 일단 rightchild nil
    }
    
    // MARK: - Pre-order Traversal
    func traversePreOrder(visit: (Element) -> Void) {
        visit(value)
        leftChild?.traversePreOrder(visit: visit)
        rightChild?.traversePreOrder(visit: visit)
    }
    
    // MARK: - Post-order Traversal
    func traversePostOrder(visit: (Element) -> Void) {
        leftChild?.traversePostOrder(visit: visit)
        rightChild?.traversePostOrder(visit: visit)
        visit(value)
    }
    
    // MARK: - Challenge를 위한 Traversal
    func traversePreOrderForChallenge(visit: (Element?) -> Void) {
        visit(value)
        if let leftChild = leftChild {
            leftChild.traverseInOrder(visit: visit)
        } else {
            visit(nil)
        }
        
        if let rightChild = rightChild {
            rightChild.traverseInOrder(visit: visit)
        } else {
            visit(nil)
        }
    }
}
