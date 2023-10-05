//
//  sortExercise.swift
//  prac2
//
//  Created by phang on 10/5/23.
//

import Foundation

struct SortExercise {
    
    /*
     배열을 복사해서 새로운 배열을 만든다.
     배열의 크기를 n이라고...
     n-1번 반복한다
     i번째부터 n-1번째까지의 원소들을 순회
     j번째 원소가 j+1번째 원소보다 크면 서로 교환
     정렬된 배열을 반환한다.
     [5,3,6,2,1] -> [1,2,3,5,6]
     */
    func bubbleSort(_ arr: [Int]) -> [Int] {
        let arrLength = arr.count
        var result = arr
        
        for i in 0..<arrLength - 1 {
            for j in 0..<arrLength - 1 - i {
                if result[j] > result[j + 1] {
                    result.swapAt(j, (j + 1))
                }
            }
        }
        return result
    }
    
    /*
     선택 정렬
     selection sort 는 배열에서 가장 작은 값을 찾아서 맨 앞의 값과 교환하는 과정을 반복하는 정렬 알고리즘이다.
     시간 복잡도는 O(n^2) 이다.
     배열의 크기만큼 반복한다.
     현재 인덱스 다음부터 배열의 끝까지 반복하면서 최소값 인덱스를 찾는다.
     현재 값이 최소값보다 작으면 최소값 인덱스 갱신
     최소값 인덱스가 현재 인덱스와 다르면 두 값을 교환
     정렬된 배열을 반환
     */
    func selectionSort(_ arr: [Int]) -> [Int] {
        let arrLength = arr.count
        var result = arr
    
        for i in 0..<arrLength - 1 {
            var minIndex = i
            for j in (i + 1)..<arrLength {
                if result[j] < result[minIndex] {
                    minIndex = j
                }
            }
            result.swapAt(i, minIndex)
        }
        return result
    }
    
    /*
     정렬 예제 1
     가장 많이 들은 것부터 가장 적게 들은 것 순서로 정렬하여 가장 좋아하는 곡 순위를 알고 싶다면?
     */
    // Struct 로 구성된 데이터를 가지고 sorting
    func sortExercise01_1(data: [Song]) -> [Song] {
        let playList = data.sorted { $0.play < $1.play }
        return playList
    }
    // Json file 을 불러와서 sorting
    func sortExercise01_2(file: String) -> [Songs]? {
        guard let jsonData = loadJson(fileName: file),
              let songData = try? JSONDecoder().decode(SortExerciseData.self, from: jsonData)
        else { return nil }
        
        let playCountSortedData = songData.songs.sorted { $0.play < $1.play }
        return playCountSortedData
    }

}


// MARK: - JSON 불러오기
extension SortExercise {
    
    private func loadJson(fileName: String) -> Data? {
        let filePath = "/Users/phang/Desktop/LikeLion_iOS/swift/prac2/prac2/\(fileName)"
        
        do {
            let data = try Data(contentsOf: URL(filePath: filePath))
            return data
        } catch {
            print("Error - 파일 읽어오기 실패")
            return nil
        }
    }
    
}
