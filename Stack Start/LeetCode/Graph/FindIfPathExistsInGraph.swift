import Foundation

class SolutionGraphB {
    func validPath(_ n: Int, _ edges: [[Int]], _ source: Int, _ destination: Int) -> Bool {
        var pathInfo = [Int: [Int]]()
        
        if source == destination {
            return true
        }
        
        edges.forEach { edge in
            pathInfo[edge[0], default: []].append(edge[1])
            pathInfo[edge[1], default: []].append(edge[0])
        }
        
        var sources = [source]
        
        while !sources.isEmpty {
            let start = sources.removeLast() // 시작 지점을 빼냄
            guard let end = pathInfo[start] else { // 도착할 수 있는 지점을 빼냄
                continue
            }
            if end.contains(destination) { // 도착 가능 지점에 도착지가 포함되어 있는지 확인
                return true
            }
            pathInfo.removeValue(forKey: start) // 해당 지점은 이미 방문한 곳이기 때문에 제거
            
            sources += end // 도착지를 다시 출발지로 변경
        }
        
        return false
        
        
        
//         var connectedVertices = []
        
//         edges.forEach { edge in
//             if edge.contains(source) {
//                 edge.forEach { element in
//                     if element != source {
//                         connectedVertices.append(element)
//                     }
//                 }
//             }
//         }
        
        
        
//         // flatmap으로 해서 요소가 2개가 아니라면 false
//         let flatEdges = edges.flatMap { $0 }
        
//         if flatEdges.count == 2 { // n: 5 edges: [[0, 4]]
//             return true
//         }
        
//         for element in flatEdges {
//             let firstIndex = flatEdges.firstIndex(of: element)
//             let secondIndex = flatEdges.lastIndex(of: element)
            
//             if firstIndex == secondIndex {
//                 return false
//             }
//         }
        
//         return true
        
        
        
//         // 단방향일 때는 되는데 현재는 양방향이기 때문에 [[0,7],[0,8],[6,1],[2,0],[0,4],[5,8],[4,7],[1,3],[3,5],[6,5]] 이 경우를 찾지 못함.
//         var newSource: Int?
//         var newDestination: Int?
        
//         if edges.isEmpty { // 빈 배열일 경우 true가 나와야 함.
//             return true
//         }
        
//         for edge in edges {
//             if edge[0] == source && edge[1] == destination {
//                 return true
//             } else if edge[0] == source {
//                 let destination = edge[1]
//                 newSource = destination
//             } else if edge[1] == destination {
//                 let source = edge[0]
//                 newDestination = source
//             }
//         }
        
//         guard let newSource = newSource, let newDestination = newDestination else {
//             return false
//         }
        
//         if newSource == newDestination {
//             return true
//         }
              
//         return validPath(n, edges, newSource, newDestination)
        
        
//        var edges = edges
//        var connectedVertices = [Int]()
//        var result = false
//
//        if edges.isEmpty {
//            return true
//        }
//
//        for edge in edges {
//            if edge.contains(source) && edge.contains(destination) {
//                return true
//            }
//
//            if edge.contains(source) {
//                let elementIndex = edge.firstIndex(of: source)
//                let index = edges.firstIndex(of: edge)
//
//                if elementIndex == 0 {
//                    connectedVertices.append(edge[1])
//                    edges.remove(at: index!)
//                } else if elementIndex == 1 {
//                    connectedVertices.append(edge[0])
//                    edges.remove(at: index!)
//                }
//            }
//
////             if edge[0] == source {
////                 connectedVertex = edge[1]
////                 edges.remove(at: index)
//
////                 return validPath(n, edges, connectedVertex, destination)
////             } else if edge[1] == source {
////                 connectedVertex = edge[0]
////                 edges.remove(at: index)
//
////                 return validPath(n, edges, connectedVertex, destination)
////             }
//        }
//
//        // print(connectedVertices)
//        // for connectedVertex in connectedVertices {
//        //     if edges.flatMap { $0 }.contains(connectedVertex) {
//        //         print(connectedVertex)
//        //         print(edges)
//        //         return validPath(n, edges, connectedVertex, destination)
//        //     }
//        // }
//        // print(connectedVertices)
//        connectedVertices.forEach { connectedVertex in
//            if edges.flatMap { $0 }.contains(connectedVertex) {
//                // print(connectedVertex)
//                // print(edges)
//                result = validPath(n, edges, connectedVertex, destination)
//            }
//        }
//
//        if result == true {
//            return true
//        }
//
//        return false
//
//        // return validPath(n, edges, connectedVertex!, destination)
    }
}

// [[4,3],[1,4],[4,8],[1,7],[6,4],[4,2],[7,4],[4,0],[0,9],[5,4]]

// 5의 destination -> 4
// 9의 source -> 0
// Graph는 대부분 딕셔너리 사용
// 현재는 양방향
