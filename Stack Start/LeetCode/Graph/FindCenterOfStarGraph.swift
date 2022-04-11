import Foundation

class SolutionGraphA {
    func findCenter(_ edges: [[Int]]) -> Int {
        var center = 0
        let firstComponent = edges[0][0] // 배열은 항상 2개로 구성되어 있기 때문에 이렇게 상수로 받아놓음.
        let secondComponent = edges[0][1]
        
        edges.forEach { edge in // 중간에 flow가 끊기면 안돼서 forEach 사용
            if edge.contains(firstComponent) { // 처음 거 확인하고
                center = firstComponent // 있으면 걔가 Center이기 때문에 할당
            } else if edge.contains(secondComponent) { // 아니면 다음거 확인
                center = secondComponent
            }
        }
        
        return center 
    }
}
