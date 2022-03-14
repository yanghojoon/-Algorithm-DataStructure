import Foundation


extension RandomAccessCollection where Element: Comparable {
    func binarySearch(for value: Element, in range: Range<Index>? = nil) -> Index? {
        let range = range ?? startIndex..<endIndex
        guard range.lowerBound < range.upperBound else { // 만약 UpperBound가 lowerBound보다 크지 않다면 요소가 하나 이하인 것.
            return nil
        }
        
        let size = distance(from: range.lowerBound, to: range.upperBound) // 전체 크기를 파악함.
        let middle = index(range.lowerBound, offsetBy: size / 2) // range.lowerBound로 부터 size의 절반인 index를 반환
        
        if self[middle] == value {
            return middle
        } else if self[middle] > value { // 만약 middle의 값이 value보다 크다면
            return binarySearch(for: value, in: range.lowerBound..<middle) // sorted되어 있기 때문에 앞에서 미들까지만 확인하면 된다.
        } else { // 그게 아니면
            return binarySearch(for: value, in: index(after: middle)..<range.upperBound) // 중간부터 끝까지 확인하면 된다
        }
    }
    
//    func findIndicies(of value: Element, in range: Range<Index>? = nil) -> Range<Index>? {
//        let range = range ?? startIndex..<endIndex
//
//        guard range.lowerBound < range.upperBound else {
//            return nil
//        }
//
//        let size = distance(from: range.lowerBound, to: range.upperBound)
//        let middle = index(range.lowerBound, offsetBy: size / 2)
//
//        if self[middle] == value {
//            guard let firstindex = binarySearch(for: value, in: range.lowerBound..<middle) else {
//                return nil
//            }
//            guard let lastindex = binarySearch(for: value, in: index(after: middle)..<range.upperBound) else {
//                return nil
//            }
//            return firstindex..<index(after: lastindex)
//        } else if self[middle] > value {
//            return findIndicies(of: value, in: range.lowerBound..<middle)
//        } else {
//            return findIndicies(of: value, in: index(after: middle)..<range.upperBound)
//        }
//    }
    
    func findIndicies(of value: Int, in range: [Int]) -> ClosedRange<Int>? {
        guard let startIndex = range.firstIndex(of: value) else {
            return nil
        }
        
        guard let endIndex = range.lastIndex(of: value) else {
            return nil
        }
        
        return startIndex...endIndex
    }
    
    func findIndiciesForBinarySearch(of value: Int, in array: [Int]) -> CountableRange<Int>? {
        guard let startIndex = firstIndex(of: value, in: array, range: 0..<array.count) else {
            return nil
        }
        
        guard let endIndex = lastIndex(of: value, in: array, range: 0..<array.count) else {
            return nil
        }
        
        return startIndex..<endIndex
    }
    
    func firstIndex(of value: Int, in array: [Int], range: CountableRange<Int>) -> Int? {
        let middleIndex = range.lowerBound + (range.upperBound - range.lowerBound) / 2
        
        if middleIndex == 0 || middleIndex == array.count - 1 { // 아예 없거나
            if array[middleIndex] == value {
                return middleIndex
            } else {
                return nil
            }
        }
        
        if array[middleIndex] == value {
            if array[middleIndex - 1] != value { // 바로 이전에 없으면 이전에는 아예 없는 것이기 때문
                return middleIndex
            } else { // 아니면 이전에서 또 firstIndex를 찾음
                return firstIndex(of: value, in: array, range: range.lowerBound..<middleIndex)
            }
        } else if value < array[middleIndex] { // 찾으려는 값이 가운데에 있는 값보다 작으면 작은 쪽에서 찾아야 함.
            return firstIndex(of: value, in: array, range: range.lowerBound..<middleIndex)
        } else {
            return firstIndex(of: value, in: array, range: middleIndex..<range.upperBound)
        }
    }
    
    func lastIndex(of value: Int, in array: [Int], range: CountableRange<Int>) -> Int? {
        let middleIndex = range.lowerBound + (range.upperBound - range.lowerBound) / 2
        
        if middleIndex == 0 || middleIndex == array.count - 1 { // 아예 없거나
            if array[middleIndex] == value {
                return middleIndex + 1
            } else {
                return nil
            }
        }
        
        if array[middleIndex] == value {
            if array[middleIndex + 1] != value { // 바로 이전에 없으면 이전에는 아예 없는 것이기 때문
                return middleIndex + 1
            } else { // 아니면 이전에서 또 firstIndex를 찾음
                return lastIndex(of: value, in: array, range: middleIndex..<range.upperBound)
            }
        } else if value < array[middleIndex] { // 찾으려는 값이 가운데에 있는 값보다 작으면 작은 쪽에서 찾아야 함.
            return lastIndex(of: value, in: array, range: range.lowerBound..<middleIndex)
        } else {
            return lastIndex(of: value, in: array, range: middleIndex..<range.upperBound)
        }
    }
}
