import XCTest
@testable import DataStructures


class BinarySearchTestCase: XCTestCase {
    func test_binarySearch() {
        let array = [1, 5, 18, 32, 33, 33, 47, 49, 502]
        
        XCTAssertEqual(array.binarySearch(for: 5), 1)
    }
    
    func test_challenge() {
        let array = [1, 2, 3, 3, 3, 4, 4, 5, 5]
        let range = array.findIndicies(of: 3, in: array)
        
        XCTAssertEqual(range, 2...4)
    }
}
