import Foundation


func solutionChallenge(_ price:Int, _ money:Int, _ count:Int) -> Int64{
    var answer:Int64 = -1
    var sum = 0
    
    if count == 1 {
        answer = Int64(price - money)
        
        if answer <= 0 {
            return 0
        }
        
        return answer
    }
    
    for multipleNumber in 1...count {
        sum += multipleNumber * price
    }
    
    answer = Int64(sum - money)
    
    if answer <= 0 {
        return 0
    }
    
    return answer
}
