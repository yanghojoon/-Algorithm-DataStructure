import Foundation

func solution(_ arr:[Int]) -> Double {
    let count = Double(arr.count)
    let sum = arr.reduce(0) { a, b in
        return a + b
    }
    let doubleSum = Double(sum)

    return doubleSum / count
}
