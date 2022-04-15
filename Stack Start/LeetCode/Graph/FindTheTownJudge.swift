import Foundation


class SolutionGraphC {
    func findJudge(_ n: Int, _ trust: [[Int]]) -> Int {
        var trustRelationship = [Int: [Int]]()
        var intersection = Set(trustRelationship[1] ?? [])
        
        // 빈 배열일 경우 & trust에 하나 밖에 값이 없을 경우 바로 return 처리
        if trust.isEmpty && n == 1 {
            return 1
        } else if trust.isEmpty && n > 1 {
            return -1
        } else if trust.count == 1 {
            return trust[0][1]
        }
        
        // 어떤 사람이 어떤 사람들을 믿고 있는지 확인
        trust.forEach { relationship in
            trustRelationship[relationship[0], default: []].append(relationship[1])
        }
        // intersection 초기값 설정
        intersection = Set(trustRelationship[1] ?? [1]) // 왜 옵셔널일 경우 [1]을 해주면 해결이 되는지...
        
        // 애초에 본인을 제외한 모든 사람이 믿지 않는 경우 -1을 return 해야 함. 총 4명인데 1, 2번만 신뢰하는 사람이 있을 경우
        if trustRelationship.count < n - 1 {
            return -1
        }
        
        // 후보군 중 반복문을 돌며 겹치는 사람이 있는지 확인
        for (believer, list) in trustRelationship {
            intersection = Set(list).intersection(intersection)
        }

        if intersection.isEmpty {
            return -1
        } else {
            return Array(intersection)[0]
        }
    }
    
//    func findJudge(_ n: Int, _ trust: [[Int]]) -> Int {
//        // var trust = trust
//        var trustRelationship = [Int: Int]()
//        var beliver = trust[0][0]
//        var judge = trust[0][1]
//        var judgeList = [Int]()
//        var output = 0
//
//
//
//        // trust가 빈 배열일 경우 대응
//        if trust.isEmpty && n == 1 {
//            return 1
//        } else if trust.isEmpty && n > 1 {
//            return -1
//        } else if trust.count == 1 {
//            return judge
//        }
//
//        // trust.enumerated().forEach { (index, relationship) in
//        //     if relationship[0] == 1 {
//        //         judgeList.append(relationship[1])
//        //         trust.remove(at: index)
//        //     }
//        // }
//
//
//        // for expectedjudge in judgeList {
//        //    for relationship in trust {
//        //         if relationship[1] == judgeList {
//        //             output = judge
//        //         } else {
//        //             return -1
//        //         }
//        //     }
//        // }
//
//        for relationship in trust {
//            if relationship[1] == judge {
//                beliver = relationship[0]
//                output = judge
//            } else if relationship[0] == beliver {
//                 judgeList.append(relationship[1])
//            } else {
//                return -1
//            }
//        }
//
//        return output
//    }
//
//    func findJudgeB(_ n: Int, _ trust: [[Int]]) -> Int {
//        var trustRelationship = [Int: [Int]]()
//        var believer = trust[0][0]
//        var intersection = Set<Int>()
//
//        if trust.isEmpty && n == 1 {
//            return 1
//        } else if trust.isEmpty && n > 1 {
//            return -1
//        }
//
//        trust.forEach { relationship in
//            trustRelationship[relationship[0], default: []].append(relationship[1])
//        }
//
//        trustRelationship.forEach { (believer, candidate) in
//
//        }
//
//        return 0
//    }
}

// n명의 사람이 존재하며 그 중 한 명은 town judge라는 소문이 존재
// 만약 judge가 존재한다면 1. judge는 아무도 믿지 않고 2. 모두는 judge를 믿고 3. 프로퍼티 1, 2를 충족하는 한 사람이 있다.
// [0]이 [1]을 신뢰

// [1]이 전부 같다면 그 사람이 Judge? -> 이 방법으론 해결 불가 믿는 사람이 여러 명일 경우 대응 불가. 
