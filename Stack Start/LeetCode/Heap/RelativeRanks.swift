import Foundation


class SolutionHeapC {
    func findRelativeRanks(_ score: [Int]) -> [String] { // [10,3,8,9,4]
        let sortedHighScore: [Int] = score.sorted().reversed() // 일단 점수를 큰 점수로 정렬, 타입 지정해줘야 함. 아니면 reversed 타입으로 인식
        var ranks = [Int]()
        var result = [String]()
        
        for myScore in score {
            guard let rank = sortedHighScore.firstIndex(of: myScore) else { return [] }
            
            ranks.append(rank + 1)
        }
        
        ranks.forEach { rank in
            switch rank {
            case 1:
                result.append("Gold Medal")
            case 2:
                result.append("Silver Medal")
            case 3:
                result.append("Bronze Medal")
            default:
                result.append("\(rank)")
            }
        }
        
        return result
    }
}
