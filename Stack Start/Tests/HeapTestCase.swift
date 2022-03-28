import XCTest
@testable import DataStructures


final class HeapTestCase: XCTestCase {

    func test_peek() {
        var heap = Heap(unsortedInts, areSorted: >)
        XCTAssertEqual(heap.peek(), 12)
    }
    
    func test_removeRoot() {
        var heap = Heap(unsortedInts, areSorted: >)
        XCTAssertEqual(heap.removeRoot(), 12)
    }
    
    private let unsortedInts = [1, 12, 3, 4, 1, 6, 8, 7]

}
