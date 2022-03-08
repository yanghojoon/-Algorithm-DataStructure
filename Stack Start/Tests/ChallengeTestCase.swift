import XCTest
@testable import DataStructures

// 내 풀이
//func checkParentheses(_ string: String) -> Bool {
//    var stack = Stack<Character>(Array(string))
//    var count = 0
//
//    while stack.isEmpty == false {
//        let popCharacter = stack.pop()
//        if popCharacter == "(" {
//            count += 1
//        } else if popCharacter == ")" {
//            count -= 1
//        }
//    }
//
//    return count == 0
//}

// 다른 풀이
func checkParentheses(_ string: String) -> Bool {
    var stack = Stack<Character>()
    
    for character in string {
        if character == "(" {
            stack.push(character)
        } else if character == ")" {
            if stack.isEmpty {
                return false
            } else {
                stack.pop()
            }
        }
    }
    
    return stack.isEmpty
}

final class StackChallengeTestCase: XCTestCase {
  func test_checkParens() {
    XCTAssertTrue( checkParentheses("()") )
  }
  
  func test_checkParens1() {
    XCTAssertTrue( checkParentheses("hello(world)()") )
  }
  
  func test_checkParens2() {
    XCTAssertFalse( checkParentheses("(hello world") )
  }
  
  func test_checkParens3() {
    XCTAssertFalse( checkParentheses("((())(meow)))()))") )
  }
  
}
