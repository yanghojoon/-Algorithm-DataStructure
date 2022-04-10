import Foundation
class SolutionStackA {
    func maxDepth(_ s: String) -> Int {
        var count = 0
        var result = 0
        
        s.map { character in
            switch character {
            case "(":
                count += 1
                result = max(count, result)
            case ")":
                count -= 1
            default:
                print("괄호 아님")
                break
            }
        }
        return result
    }
}
