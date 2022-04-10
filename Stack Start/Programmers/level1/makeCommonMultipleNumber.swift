import Foundation

func solution(_ x:Int, _ n:Int) -> [Int64] {
    var array: [Int64] = []
    for number in 1...n {
        array.append(Int64(number * x))
    }
    
    return array
}
