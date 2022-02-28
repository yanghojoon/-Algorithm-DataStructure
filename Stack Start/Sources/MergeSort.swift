//
//  MergeSort.swift
//  DataStructures
//
//  Created by 양호준 on 2022/02/27.
//

import Foundation

func mergeSort<Element: Comparable>(_ array: [Element]) -> [Element] {
    guard array.count > 1 else {
        return array
    }
    
    let middle = array.count / 2
    let left = mergeSort(Array(array[..<middle]))
    let right = mergeSort(Array(array[middle...])) // 재귀함수로 자를 수 없을 때까지 자르게 됨.
    
    return merge(left, right)
}

func merge<Element: Comparable>(_ left: [Element], _ right: [Element]) -> [Element] {
    var leftIndex = 0
    var rightIndex = 0
    var result: [Element] = []
    
    while leftIndex < left.count && rightIndex < right.count {
        let leftElement = left[leftIndex]
        let rightElement = right[rightIndex]
        
        if leftElement < rightElement {
            result.append(leftElement)
            leftIndex += 1
        } else if leftElement > rightElement {
            result.append(rightElement)
            rightIndex += 1
        } else { // rightElement와 leftElement가 같은 경우
            result.append(leftElement)
            leftIndex += 1
            result.append(rightElement)
            rightIndex += 1
        }
    }
    
    // 쪼개고 나서 하나만 남아 있는 경우
    if leftIndex < left.count {
        result.append(contentsOf: left[leftIndex...])
    }
    if rightIndex < right.count {
        result.append(contentsOf: right[rightIndex...])
    }
    
    return result
}
