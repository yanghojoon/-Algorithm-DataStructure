import Foundation


class SolutionHeapB {
    func lastStoneWeight(_ stones: [Int]) -> Int {
        var sortedStone = stones.sorted() // 일단 돌을 무게 순으로 정렬
        
        while sortedStone.count > 2 {
            let firstHeavyStone = sortedStone.removeLast() // 마지막에 있는게 가장 무거운 돌이기 때문에 빼고
            let secondHeavyStone = sortedStone.removeLast() // 그 다음 무거운 돌을 뺀다.
            
            if firstHeavyStone != secondHeavyStone { // 이 둘이 같다면 그냥 더하지 않고 진행을 하기 때문에 돌의 무게가 다를 떄
                let splitStone = firstHeavyStone - secondHeavyStone // 각 돌의 무게를 빼서 추가할 돌의 무게를 구하고
                sortedStone.append(splitStone) // 넣은 뒤
                sortedStone = sortedStone.sorted() // 다시 정렬
            }
        }
        
        if sortedStone.count == 2 { // 2개일 때에는
            return sortedStone[1] - sortedStone[0] // 무거운 돌에서 가벼운 돌을 뺀 다음 값 반환
        }
        
        return sortedStone[0] // 1개인 경우 sortedSort에서 마지막 남은 돌 꺼냄.
    }
}
