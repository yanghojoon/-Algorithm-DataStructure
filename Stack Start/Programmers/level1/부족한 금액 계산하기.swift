import Foundation


func solutionChallenge(_ price:Int, _ money:Int, _ count:Int) -> Int64{
    // MARK: - 풀이 1
//    var answer:Int64 = -1
//    var sum = 0
//    
//    if count == 1 {
//        answer = Int64(price - money)
//        
//        if answer <= 0 {
//            return 0
//        }
//        
//        return answer
//    }
//    
//    for multipleNumber in 1...count {
//        sum += multipleNumber * price
//    }
//    
//    answer = Int64(sum - money)
//    
//    if answer <= 0 {
//        return 0
//    }
//    
//    return answer
    
    //MARK: - 풀이 2
    let total = (1...count).reduce(0) { partialResult, number in
        partialResult + number * price
    }
    
    return max(Int64(0), Int64(total - money))
}
