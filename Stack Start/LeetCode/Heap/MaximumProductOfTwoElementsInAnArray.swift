import Foundation


class SolutionHeapA {
    func maxProduct(_ nums: [Int]) -> Int {
        let sortedNums = nums.sorted()
        let lastIndex = nums.count - 1
        
        return (sortedNums[lastIndex] - 1) * (sortedNums[lastIndex - 1] - 1)
    }
}
