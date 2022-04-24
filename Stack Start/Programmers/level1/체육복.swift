import Foundation

func solutionGreedyA(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {
    var spairList = reserve.sorted()
    var lostList = lost.sorted()
    // 빌려줄 수 있는 사람이 도난 당한 경우
    let intersection = Array(Set(lostList).intersection(Set(spairList))).sorted()
    
    func lendClothes(from spair: Int, to lost: Int) {
        let removeSpairIndex = spairList.firstIndex(of: spair)!
        let removeLostIndex = lostList.firstIndex(of: lost)!

        spairList.remove(at: removeSpairIndex)
        lostList.remove(at: removeLostIndex)
    }
    
    // 이 경우 여분 리스트와 실종 리스트에서 삭제
    if intersection.count > 0 {
        intersection.forEach { person in
            lendClothes(from: person, to: person)
        }
    }

    for lostPerson in lostList {
        let front = lostPerson - 1
        let back = lostPerson + 1
        
        if spairList.contains(front) { // 앞 사람이 빌려줄 수 있는 경우
            lendClothes(from: front, to: lostPerson)
        } else if spairList.contains(back) { // 뒷사람이 빌려줄 수 있는 경우
            lendClothes(from: back, to: lostPerson)
        }
    }
    
    return n - lostList.count
}
