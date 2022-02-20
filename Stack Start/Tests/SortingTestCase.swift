//
//  SortingTestCase.swift
//  DataStructuresTests
//
//  Created by 양호준 on 2022/02/18.
//

import XCTest
@testable import DataStructures

final class SortingTestCase: XCTestCase {
  var testArray: [Int] = []
  let sortedArray = [3, 4, 9, 10]
  
  override func setUp() {
    testArray = [9, 4, 10, 3]
  }
  
  func test_bubbleSort() {
    bubbleSort(&testArray)
    XCTAssertEqual(testArray, sortedArray)
  }
  
  func test_selectionSort() {
      selectionSort(&testArray)
      XCTAssertEqual(testArray, sortedArray)
  }
  
  func test_insertionSort() {

  }
}

