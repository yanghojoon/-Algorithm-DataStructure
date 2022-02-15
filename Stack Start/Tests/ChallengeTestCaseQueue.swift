//
//  ChallengeTestCaseQueue.swift
//  DataStructuresTests
//
//  Created by 양호준 on 2022/02/15.
//

import XCTest
@testable import DataStructures

protocol BoardGameManager {
  associatedtype Player
  mutating func nextPlayer() -> Player?
}

//TODO: Extend one (or both!) queue implementation(s) to adopt the BoardGameManager protocol
// 나의 풀이
//extension QueueStack: BoardGameManager where T == String {
//    @discardableResult
//    mutating func nextPlayer() -> String? {
//        dequeue()
//    }
//}

extension QueueStack: BoardGameManager {
    typealias Player = T
    
    @discardableResult
    mutating func nextPlayer() -> T? {
        guard let player = dequeue() else {
            return nil
        }
        enqueue(player)
        return player
    }
}

final class ChallengeTestCase: XCTestCase {
  func test_playerOrder() {
    var queue = QueueStack<String>()
    queue.enqueue("Kirby")
    queue.enqueue("Samus")
    queue.enqueue("Pikachu")
    queue.enqueue("Toon Ozma")
    
    XCTAssertEqual(queue.peek, "Kirby")
    queue.nextPlayer()
    queue.nextPlayer()
    XCTAssertEqual(queue.peek, "Pikachu")
    queue.nextPlayer()
    XCTAssertEqual(queue.peek, "Toon Ozma")
  }
}
