import Foundation


class SolutionHeapB {
    func lastStoneWeight(_ stones: [Int]) -> Int {
        var sortedStone = stones.sorted()
        
        while sortedStone.count > 2 {
            let firstHeavyStone = sortedStone.removeLast()
            let secondHeavyStone = sortedStone.removeLast()
            
            if firstHeavyStone != secondHeavyStone {
                let splitStone = firstHeavyStone - secondHeavyStone
                sortedStone.append(splitStone)
                sortedStone = sortedStone.sorted()
            }
        }
        
        if sortedStone.count == 2 {
            return sortedStone[1] - sortedStone[0]
        }
        
        return sortedStone[0]
    }
}
