struct Stack<Element: Equatable>: Equatable {
    // Storage
    private var storage = [Element]()
    
    // IsEmpty
    var isEmpty: Bool {
        return peek() == nil
    }
    
    // Initializer
    init() { } // 빈 배열을 생성하는 이니셜라이저
    
    init(_ elements: [Element]) { // 특정 배열을 생성하는 이니셜라이저
        storage = elements
    }
    
    // Peek
    func peek() -> Element? {
        return storage.last
    }
    
    // Push
    mutating func push(_ element: Element) {
        storage.append(element)
    }
    
    // Pop
    @discardableResult
    mutating func pop() -> Element? {
        return storage.popLast()
    }
}

extension Stack: CustomStringConvertible {
    var description: String {
        return storage.map { "\($0)" }.joined(separator: " ")
    }
}

extension Stack: ExpressibleByArrayLiteral {
    init(arrayLiteral elements: Element...) {
        storage = elements
    }
}
