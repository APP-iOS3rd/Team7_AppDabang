import UIKit
import Foundation

//let documentPath = "/Users/lkh/Documents/XcodeProject/FileManagerEX/"

// MARK: - 디렉토리 및 파일 예제 01
// <현재 디렉토리>에 있는 모든 파일의 이름과 크기를 출력하는 코드를 작성해보세요.
func ex_01() {
    let fileManager = FileManager.default
    let currentPath = fileManager.currentDirectoryPath
    print(currentPath)
    do {
        let files = try fileManager.contentsOfDirectory(atPath: currentPath)
        for file in files.sorted() {
            // 파일 이름과 크기를 출력하는 코드를 작성하세요.
            let filePath = currentPath + "/" + file
            let attribs: NSDictionary = try fileManager.attributesOfItem(atPath: filePath) as NSDictionary
            let fileSize = attribs["NSFileSize"] as! UInt64
            print("\(file): \(fileSize) bytes")
            
        }
    } catch {
        print(error)
    }
}

ex_01()

// MARK: - 디렉토리 및 파일 예제 02
// 특정 디렉토리에 있는 모든 <이미지> 파일을 새로운 디렉토리로 복사하는 코드를 작성해보세요.
// 이미지 파일은 확장자가 .jpg, .png, .gif 인 파일로 가정합니다.
//let sourcePath = "/Users/lkh/Desktop/img"    // 예시 디렉토리
//let destinationPath = "/Users/lkh/Documents/XcodeProject/FileManagerEX" // 예시 디렉토리

func ex_02() {
    let fileManager = FileManager.default
    
    do {
        let sourcePath = fileManager.urls(for: .documentDirectory, in: .userDomainMask)[0].path
        let destinationPath = sourcePath + "/" + "Backup"
        print(sourcePath)
        print(destinationPath)
        
        try fileManager.createDirectory(atPath: destinationPath, withIntermediateDirectories: true)
        let files = try fileManager.contentsOfDirectory(atPath: sourcePath)
        for file in files {
            // 파일을 복사
            let filePath = sourcePath + "/" + file
            let fileExtension = (file as NSString).pathExtension.lowercased()
            if fileExtension == "dat" {
                let destinationFilePath = destinationPath + "/" + file
                try fileManager.copyItem(atPath: filePath, toPath: destinationFilePath)
            }
        }
    } catch {
        print(error)
    }
}

ex_02()

// MARK: - 디렉토리 및 파일 예제 03
// 특정 파일에 있는 텍스트를 역순으로 바꾸어 새로운 파일에 저장하는 코드를 작성해보세요.
// 예를 들어, 원본 파일에 "Hello World" 가 있으면, 새로운 파일에 "dlroW olleH" 가 저장되어야 합니다.

//let sourcePath = "/Users/lkh/Documents/XcodeProject/FileManagerEX/text.txt"    // 예시 디렉토리
//let destinationPath = "/Users/lkh/Documents/XcodeProject/FileManagerEX/reversed.txt" // 예시 디렉토리

func ex_03() {
    let fileManager = FileManager.default
    
    do {
        let documentPath = fileManager.urls(for: .documentDirectory, in: .userDomainMask)[0].path
        let sourceFile = documentPath + "/" + "datafile.dat"
        let destinationFile = documentPath + "/" + "reversed.txt"
        
        // 텍스트를 역순으로 바꾸어 저장하는 코드
        let data = try Data(contentsOf: URL(fileURLWithPath: sourceFile))
        if let text = String(data: data, encoding: .utf8) {
            let reversedText = String(text.reversed())
            if let reverseData = reversedText.data(using: .utf8) {
                try reverseData.write(to: URL(fileURLWithPath: destinationFile))
            }
        }
        
        // 변경된 파일 확인
        
    } catch {
        print(error)
    }
}

ex_03()

// MARK: - 디렉토리 및 파일 예제 04
/*
 특정 파일에 있는 숫자들을 읽어서 합계와 평균을 구하고, 그 결과를 새로운 파일에 저장하는 코드를 작성해보세요.
 
 (숫자들은 한 줄에 하나씩 정수로 저장되어 있다고 가정합니다.)
 (또는 숫자들은 ','로 구분하여 저장되어 있다고 가정합니다.)
 */
func ex_04() {
    let fileManager = FileManager.default
    
    do {
        let documentPath = fileManager.urls(for: .documentDirectory, in: .userDomainMask)[0].path
        let sourceFile = documentPath + "/" + "datafile.dat"
        let destinationFile = documentPath + "/" + "summary.txt"
        
        // 숫자들의 합계와 평균을 구하고 저장하는 코드
        let data = try Data(contentsOf: URL(fileURLWithPath: sourceFile))
        if let text = String(data: data, encoding: .utf8) {
            
            let numbers = text.split(separator: ",").compactMap { Int($0) }
            let sum = numbers.reduce(0, +)
            let average = Double(sum) / Double(numbers.count)
            let summary = "합계: \(sum)\n평균: \(average)"
            
            if let summaryData = summary.data(using: .utf8) {
                try summaryData.write(to: URL(fileURLWithPath: destinationFile))
            }
        }
        
        // 변경된 파일 확인
        
    } catch {
        print(error)
    }
}

ex_04()

// MARK: - 디렉토리 및 파일 예제 05
/*
 특정 파일에 있는 텍스트를 읽어서 단어의 빈도수를 계산하고, 그 결과를 새로운 파일에 저장하는 코드를 작성해보세요.
 
 단어는 공백으로 구분되며, 대소문자는 구분하지 않습니다.
 
 결과는 단어와 빈도수를 콜론(:)으로 구분하고, 한 줄에 하나씩 저장합니다.
 
 예를 들어, 원본 파일에 "Hello hello world" 가 있으면, 새로운 파일에 "hello:2\nworld:1" 가 저장되어야 합니다.
 */
func ex_05() {
    let fileManager = FileManager.default
    
    do {
        let documentPath = fileManager.urls(for: .documentDirectory, in: .userDomainMask)[0].path
        let sourceFile = documentPath + "/" + "datafile.dat"
        let destinationFile = documentPath + "/" + "frequency.txt"
        
        // 단어의 빈도수를 계산하고 저장하는 코드
        let data = try Data(contentsOf: URL(fileURLWithPath: sourceFile))
        if let text = String(data: data, encoding: .utf8) {
            
            let words = text.split(separator: " ").map { $0.lowercased() }
            var frequency = [String:Int]()
            for word in words {
                frequency[word, default: 0] += 1
            }
            var result = ""
            for (word, count) in frequency {
                result += "\(word):\(count)\n"
            }
            
            if let resultData = result.data(using: .utf8) {
                try resultData.write(to: URL(fileURLWithPath: destinationFile))
            }
        }
        
        // 변경된 파일 확인
        
    } catch {
        print(error)
    }
}

ex_05()
