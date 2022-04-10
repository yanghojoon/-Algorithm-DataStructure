import Foundation

func solution(_ phone_number:String) -> String {
    var arr = Array(phone_number)
    let count = arr.count
    
    for index in 0..<count - 4 {
        arr[index] = "*"
    }
    
    let string = arr.reduce("") { String($0) + String($1) }

    return string
}
