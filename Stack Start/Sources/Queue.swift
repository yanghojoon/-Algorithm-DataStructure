//
//  Queue.swift
//  DataStructures
//
//  Created by 양호준 on 2022/02/14.
//

import Foundation

protocol Queue {
    associatedtype Element // Element가 다른 타입이 될 수 있기 때문에 Associated Type 사용
    
    mutating func enqueue(_ element: Element)
    mutating func dequeue() -> Element?
    
    var isEmpty: Bool { get }
    var peek: Element? { get }
}

// Queue Array
struct QueueArray<T>: Queue {
    private var array: [T] = []
    var isEmpty: Bool {
        return array.isEmpty
    }
    var peek: T? {
        return array.first
    }
    
    mutating func enqueue(_ element: T) {
        array.append(element)
    }
    
    @discardableResult
    mutating func dequeue() -> T? {
        return isEmpty ? nil : array.removeFirst()
    }
}
