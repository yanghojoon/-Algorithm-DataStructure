import XCTest
@testable import DataStructures



// MARK: - Serailize Function
func serialize<T>(_ node: BinaryNode<T>) -> [T?] {
    var array: [T?] = []
    
    node.traversePreOrderForChallenge { array.append($0) } // O(n)의 시간 복잡도를 가짐
    
    return array
}

// MARK: - Deserialize Function
func deserialize<T>(_ array: inout [T?]) -> BinaryNode<T>? {
    guard let value = array.removeLast() else { // 기존 밑에 메서드 없이 removeFirst로 할 경우 O(n^2) 시간 복잡도를 가짐 
        return nil
    }
    
    let node = BinaryNode(value: value)
    
    node.leftChild = deserialize(&array)
    node.rightChild = deserialize(&array)
    
    return node
}

func deserialize<T>(_ array: [T?]) -> BinaryNode<T>? {
    var reversed = Array(array.reversed()) // 그래서 배열을 뒤집고
    
    return deserialize(&reversed)
}


final class BinaryTreeTestCase: XCTestCase {
    var tree: BinaryNode<Int> = {
        let zero = BinaryNode(value: 0)
        let one = BinaryNode(value: 1)
        let five = BinaryNode(value: 5)
        let seven = BinaryNode(value: 7)
        let eight = BinaryNode(value: 8)
        let nine = BinaryNode(value: 9)
        
        seven.leftChild = one
        one.leftChild = zero
        one.rightChild = five
        seven.rightChild = nine
        nine.leftChild = eight
        
        return seven // shift + cmd + y 디버깅 콘솔창 단축키 
    }()
    
    func test_traverseInOrder() {
        var testArray = [Int]()
        tree.traverseInOrder { testArray.append($0) }
        XCTAssertEqual(testArray, [0, 1, 5, 7, 8, 9])
    }
    
    func test_traversePreOrder() {
        var testArray = [Int]()
        tree.traversePreOrder { testArray.append($0) }
        XCTAssertEqual(testArray, [7, 1, 0, 5, 9, 8])
    }

    func test_traversePostOrder() {
        var testArray = [Int]()
        tree.traversePostOrder { testArray.append($0) }
        XCTAssertEqual(testArray, [0, 5, 1, 8, 9, 7])
    }
    
    func test_serailize() {
        let expectedArray = [7, 1, 0, nil, nil, 5, nil, nil, 9, 8, nil, nil, nil]
        let serializedTree = serialize(tree)
        
        XCTAssertEqual(expectedArray, serializedTree)
    }
}
