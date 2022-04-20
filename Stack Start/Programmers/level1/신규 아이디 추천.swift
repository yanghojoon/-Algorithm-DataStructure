import Foundation


func solutionKakaoB(_ new_id:String) -> String {
    var result = ""
    // 1단계
    result = new_id.lowercased()
    // 2단계
    let specialString: CharacterSet = [
        "~", "!", "@", "#", "$", "%", "^", "&", "*", "(", ")", "=", "+", "[", "{", "]", "}",
        ":", "?", ",", "<", ">", "/"
    ]
    let filteredIDs = result.components(separatedBy: specialString)
    result = filteredIDs.joined()
    // 3단계
    while result.contains("..") {
        result = result.replacingOccurrences(of: "..", with: ".")
    }
    // 4단계 // trimmingCharacters로 제거 가능
    if result.count != 0 {
        while result.first == "." {
            result.removeFirst()
        }
        
        while result.last == "." {
            result.removeLast()
        }
    }
    // 5단계
    if result == "" {
        result.append("a")
    }
    // 6단계
    while result.count > 15 { // prefix로 구할 수도 있다. 
        result.removeLast()
        
        if result.last! == "." {
            result.removeLast()
        }
    }
    
    // 7단계
    while result.count < 3 {
        guard let lastWord = result.last else {
            continue
        }
        
        result.append(lastWord)
    }
    
    return result
}
