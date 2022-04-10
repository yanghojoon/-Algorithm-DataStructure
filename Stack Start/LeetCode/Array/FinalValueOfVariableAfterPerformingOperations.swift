import Foundation

class SolutionArrayC {
    func finalValueAfterOperations(_ operations: [String]) -> Int {
        var sum = 0
        
        operations.forEach { operation in
            if operation.contains("+") {
                sum += 1
            } else if operation.contains("-") {
                sum -= 1
            }
        }
        
        return sum
    }
}
