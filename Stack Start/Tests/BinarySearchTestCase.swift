import XCTest
@testable import DataStructures


class BinarySearchTestCase: XCTestCase {
    func test_binarySearch() {
        let array = [1, 5, 18, 32, 33, 33, 47, 49, 502]
        
        XCTAssertEqual(array.binarySearch(for: 5), 1)
    }

}
