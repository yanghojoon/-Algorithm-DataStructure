//
//  ArrayPartition1.swift
//  DataStructures
//
//  Created by 양호준 on 2022/03/01.
//

import Foundation

class SolutionSortH {
    func arrayPairSum(_ nums: [Int]) -> Int {
        let sortedNumbers = nums.sorted()
        var result = 0
        
        for index in 0..<nums.count {
            if index % 2 == 0 {
                result += sortedNumbers[index]
            }
        }
        return result
    }
}

