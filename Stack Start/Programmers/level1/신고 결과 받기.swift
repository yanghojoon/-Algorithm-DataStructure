import Foundation


func solutionKakaoA(_ id_list:[String], _ report:[String], _ k:Int) -> [Int] {
    // FIXME: - 시간초과로 테스트 2개 통과 못함
    let nonOverlapReport = Array(Set(report)) // 중복 신고를 Set을 통해 제거
    let split = nonOverlapReport.map { $0.components(separatedBy: " ") } // 일단 신고자와 신고 당한 사람을 [String]형태로 분리
    var accusingInfo = [String: [String]]()
    var accusedCount = [String: Int]()
    var blackList = [String]()
    var result = [Int]()
 
    // 분리한 이차원배열을 토대로 신고자와 신고 당한 사람의 dictonary를 생성 [신고한 사람: [신고 당한 사람 리스트]]
    split.forEach { info in
        accusingInfo[info[0], default: []].append(info[1])
    }
    
    // [신고당한 사람: 횟수]로 딕셔너리 생성
    accusingInfo.forEach { (_, list) in
        list.forEach { person in
            accusedCount[person, default: 0] += 1
        }
    }
    // 기준 이상 신고당한 사람을 블랙리스트로 생성
    accusedCount.forEach { (person, count) in
        if count >= k {
            blackList.append(person)
        }
    }
    
    id_list.forEach { person in
        var count = 0
        let list = accusingInfo[person] ?? []
        blackList.forEach { criminal in
            if list.contains(criminal) {
                count += 1
            }
        }
                        
        result.append(count)
    }
    
    
    return result

    // FIXME: - 실행으로 통과는 되나 제출을 하면 거의 대부분 실패하는 코드
//    let nonOverlapReport = Set(report)
//    let nonOverlapReportArray = Array(nonOverlapReport)
//    var accusedList = [String]()
//    var accusedCount = [String: Int]()
//    var accusingList = [String]()
//    var accusingCount = [String: Int]()
//    var blackList = [String]()
//    var result = [Int]()
//
//    // 신고 기준보다 배열 수가 적으면 무조건 정지된 계정이 없기 때문에 일단 이 경우 id_list의 누구도 메일을 받지 못함.
//    if nonOverlapReportArray.count < k {
//        for _ in 1...id_list.count {
//            result.append(0)
//        }
//
//        return result
//    }
//
//    // 신고 당한 사람의 리스트
//    report.forEach { result in
//        let reportElement = result.components(separatedBy: " ")
//
//        accusedList.append(reportElement[1])
//    }
//
//    // 신고 당한 사람들의 수
//    for reportedPerson in accusedList {
//        accusedCount[reportedPerson] = (accusedCount[reportedPerson] ?? 0) + 1
//    }
//
//    // 기준 이상 신고당한 사람들의 리스트
//    accusedCount.forEach { (person, count) in
//        if count >= k {
//            blackList.append(person)
//        }
//    }
//
//    // 기준 이상 신고당한 사람을 신고한 사람들의 리스트
//    blackList.forEach { blackID in
//        report.forEach { result in
//            let reportElement = result.components(separatedBy: " ")
//
//            if reportElement[1] == blackID {
//                accusingList.append(reportElement[0])
//            }
//        }
//    }
//
//    // 블랙리스트 고발한 사람들의 신고 수 측정
//    for person in accusingList {
//        accusingCount[person] = (accusingCount[person] ?? 0) + 1
//    }
//
//    // id 별 신고 횟수 등록
//    for id in id_list {
//        result.append(accusingCount[id] ?? 0)
//    }
//
//    return result
}
