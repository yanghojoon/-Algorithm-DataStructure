import Foundation


func solutionKakaoC(_ s:String) -> Int {
    var result = ""
    
    while Int(result) == nil {
        if result.contains("one") {
            result = result.replacingOccurrences(of: "one", with: "1")
        } else if result.contains("zero") {
            result = result.replacingOccurrences(of: "zero", with: "0")
        } else if result.contains("two") {
            result = result.replacingOccurrences(of: "two", with: "2")
        } else if result.contains("three") {
            result = result.replacingOccurrences(of: "three", with: "3")
        } else if result.contains("four") {
            result = result.replacingOccurrences(of: "four", with: "4")
        } else if result.contains("five") {
            result = result.replacingOccurrences(of: "five", with: "5")
        } else if result.contains("six") {
            result = result.replacingOccurrences(of: "six", with: "6")
        } else if result.contains("seven") {
            result = result.replacingOccurrences(of: "seven", with: "7")
        } else if result.contains("eight") {
            result = result.replacingOccurrences(of: "eight", with: "8")
        } else if result.contains("nine") {
            result = result.replacingOccurrences(of: "nine", with: "9")
        } else {
            result = s
        }
    }
    
    return Int(result)!
}
