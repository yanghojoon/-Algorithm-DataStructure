//
//  QueueTestCase.swift
//  DataStructuresTests
//
//  Created by 양호준 on 2022/02/14.
//

import XCTest
@testable import DataStructures

class QueueTestCase: XCTestCase {
    var queueArray = QueueArray<String>()
    var queueStack = QueueStack<String>()

    override func setUp() {
        queueArray.enqueue("Pusheen")
        queueArray.enqueue("Keyboard Cat")
        queueArray.enqueue("Lil Bub")
        
        queueStack.enqueue("1")
        queueStack.enqueue("2")
        queueStack.enqueue("3")
    }
    
    func test_enqueueArray() {
        XCTAssertEqual(queueArray.peek, "Pusheen")
    }
    
    func test_enqueueStack() {
        XCTAssertEqual(queueStack.peek, "1")
    }
    
    func test_dequeueArray() {
        queueArray.dequeue()
        queueArray.dequeue()
        XCTAssertEqual(queueArray.peek, "Lil Bub")
        queueArray.dequeue()
        XCTAssertTrue(queueArray.isEmpty)
    }
    
    func test_dequeueStack() {
        queueStack.dequeue()
        queueStack.dequeue()
        XCTAssertEqual(queueStack.peek, "3")
        queueStack.dequeue()
        XCTAssertTrue(queueStack.isEmpty)
    }
}
