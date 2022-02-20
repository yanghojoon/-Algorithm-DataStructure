//
//  SortingAlgorithms.swift
//  DataStructures
//
//  Created by 양호준 on 2022/02/18.
//

import Foundation

// MARK: - Bubble Sort
func bubbleSort<Element: Comparable>(_ array: inout [Element]) {
    // 2개 미만으로 있으면 sort할 필요가 없기 때문에 count가 2보다 클 경우만 함수를 정상적으로 실행하도록 한다.
    guard array.count >= 2 else { return }
    
    for end in (1..<array.count).reversed(){ // 마지막이 가장 큰 수가 나올 수 있도록 마지막 index부터 반복문 돌림.
        var isSwapped = false
        
        for current in 0..<end {
            if array[current] > array[current + 1] { // 앞에 있는 값이 더 크면 swap해주도록 조건 설정
                array.swapAt(current, current + 1) // 특정 index에 있는 값을 바꿔주는 mutating method
                isSwapped = true
            }
        }
        
        if !isSwapped {
            return // 바뀐 것이 없다면 함수 종료함. 
        }
    }
}

// MARK: - Selection Sort
func selectionSort<Element: Comparable>(_ array: inout [Element]) {
    guard array.count >= 2 else { return }
    
    for current in 0..<(array.count - 1) { // 왜 끝까지 안돌리는 건지? 마지막 전까지 돌리고 밑에서 다음 것들과 비교함.
        var lowestIndex = current // 일단 현재를 가장 작다고 가정
        
        for next in (current + 1)..<array.count { // 다음 것과 비교하기 위해 다시 반복문 생성
            if array[lowestIndex] > array[next] { // 만약 현재보다 다음 더 작은게 있다면
                lowestIndex = next // 작은 것의 인덱스를 바꿔준다.
            }
        }
        if lowestIndex != current { // 이 과정을 거쳐 현재 가장 작은 인덱스가 현재의 인덱스와 다르다면
            array.swapAt(lowestIndex, current) // 인덱스를 통해 두 값을 바꿔준다. 
        }
    }
}
