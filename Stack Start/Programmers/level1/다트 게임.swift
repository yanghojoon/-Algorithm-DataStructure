import Foundation

func solution(_ dartResult:String) -> Int {
    let scores = dartResult.split(whereSeparator: { $0.isLetter || ["*", "#"].contains($0) }).compactMap { Int($0 ) }
    let bonusesAndOptions = dartResult.split(whereSeparator: { $0.isNumber } )
    var results = [Int]()
    
    for (index, (score, bonusAndOption)) in zip(scores, bonusesAndOptions).enumerated() {
        var result = score
        
        if bonusAndOption.contains("D") {
            result *= result
        } else if bonusAndOption.contains("T") {
            result *= result * result
        }
        
        if bonusAndOption.contains("*") {
            result *= 2
            
            if index > 0 {
                results[index - 1] *= 2
            }
        } else if bonusAndOption.contains("#") {
            result *= -1
        }
        
        print(result)
        results.append(result)
    }
    print(results)
    
    return results.reduce(0, +)
}
