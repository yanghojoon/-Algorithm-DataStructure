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
}
