//
//  SortingAlgorithms.swift
//  DataStructures
//
//  Created by 양호준 on 2022/02/18.
//

import Foundation

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
