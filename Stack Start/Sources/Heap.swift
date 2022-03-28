import Foundation

struct Heap<Element: Equatable> {
    fileprivate var elements = [Element]()
    let areSorted: (Element, Element) -> Bool
    
    init(_ element: [Element], areSorted: @escaping (Element, Element) -> Bool) {
        self.areSorted = areSorted
        self.elements = element
        
        guard !element.isEmpty else { return }
        
        for index in stride(from: element.count / 2 - 1, through: 0, by: -1) { // from은 트리의 계층(단계)을 의미.
            siftDown(from: index)
        }
    }
    
    var isEmpty: Bool {
        return elements.isEmpty
    }
    
    var count: Int {
        return elements.count
    }
    
    func peek() -> Element? {
        return elements.first
    }
    
    func getChildIndicies(ofParentAt parentIndex: Int) -> (left: Int, right: Int) {
        let leftIndex = (2 * parentIndex) + 1 // binary tree는 항상 2개의 child만 가지기 때문에 이렇게 index를 구함.
        
        return (leftIndex, leftIndex + 1)
    }
    
    func getParentIndex(ofChildAt index: Int) -> Int {
        return (index - 1) / 2
    }
    
    mutating func removeRoot() -> Element? {
        guard !isEmpty else {
            return nil
        }
        
        elements.swapAt(0, count - 1) // 처음과 마지막을 바꾸고
        let originalRoot = elements.removeLast() // 마지막거를 빼면 처음거를 빼는 것과 같다.  
        siftDown(from: 0)
        
        return originalRoot
    }
    
    mutating func siftDown(from index: Int) {
        var parentIndex = index
        while true {
            let (leftIndex, rightIndex) = getChildIndicies(ofParentAt: parentIndex)
            var optionalParentSwapIndex: Int?
            
            if leftIndex < count && areSorted(elements[leftIndex], elements[parentIndex]) { // 일단 왼쪽 index가 count보다 크다면 이미 leftchild는 없는 상황.
                optionalParentSwapIndex = leftIndex // 왼쪽 child로 내려감.
            }
            if rightIndex < count && areSorted(elements[rightIndex], elements[optionalParentSwapIndex ?? parentIndex]) {
                optionalParentSwapIndex = rightIndex
            }
            
            guard let parentSwapIndex = optionalParentSwapIndex else { return }
            
            elements.swapAt(parentIndex, parentSwapIndex)
            parentIndex = parentSwapIndex
        }
    }
    
}
