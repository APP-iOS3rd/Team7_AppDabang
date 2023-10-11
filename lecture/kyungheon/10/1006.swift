//
//  main.swift
//  08
//
//  Created by lkh on 10/6/23.
//

import Foundation

// MAKR: - 퀵정렬
func quickSort(_ arr: [Int]) -> [Int]
{
    var arr = arr
    
    partiton(0, arr.count-1)
    func partiton(_ start: Int, _ end: Int) {
        if (start >= end) {
            return
        }
        
        let pivot = start; // 이게 이번 분할의 비교할 값, 편의로 제일 첫 번째로 설정
        var left = pivot+1;
        var right = end
        
        while (left <= right) {
            while (left <= end && arr[left] <= arr[pivot]) {
                left += 1
            }
            
            while (right > start && arr[right] >= arr[pivot]) {
                right -= 1
            }
            
            if (left > right) { // 왼쪽에서 출발한 것과 오른쪽에서 출발한게 엇갈린 경우
                let tmp = arr[right]
                arr[right] = arr[pivot]
                arr[pivot] = tmp
            } else {
                let tmp = arr[left]
                arr[left] = arr[right]
                arr[right] = tmp
            }
        }
        
        partiton(start, right-1)
        partiton(right+1, end)
    }
    
    return arr
}

print("quickSort([10, 5, 2, 3]):", quickSort([10, 5, 2, 3]))
print("quickSort([6, 5, 1, 4, 7, 2, 3]):", quickSort([6, 5, 1, 4, 7, 2, 3]))
