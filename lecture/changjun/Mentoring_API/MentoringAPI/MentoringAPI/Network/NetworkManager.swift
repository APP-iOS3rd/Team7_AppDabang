//
//  NetworkManager.swift
//  MentoringAPI
//
//  Created by phang on 11/9/23.
//

import Foundation

// MARK: - 네트워크 매니저
class NetworkManager {
    // 에러
    enum ManagerErrors: Error {
        case invalidURL
        case invalidResponse
        case invalidStatusCode(Int)
    }
    // HTTP
    enum HttpMethod: String {
        case get
        case post
        
        var method: String {
            return rawValue.uppercased()
        }
    }
    
    // request
    func request<T: Decodable>(fromURL urlString: String,
                               httpMethod: HttpMethod = .post) async throws -> T {
        // url 검증
        guard let url = URL(string: urlString) else {
            throw ManagerErrors.invalidURL
        }
        // url +
        var request = URLRequest(url: url)
        request.httpMethod = httpMethod.method
        // multipart header
        let boundary = UUID().uuidString
        let contentType = "multipart/form-data; boundary=\(boundary)"
        request.addValue(contentType, forHTTPHeaderField: "Content-Type")
        request.addValue(Bundle.main.ID, forHTTPHeaderField: "X-Naver-Client-Id")
        request.addValue(Bundle.main.SECRET, forHTTPHeaderField: "X-Naver-Client-Secret")
        // multipart body
        request.httpBody = createBody(boundary: boundary)
        // urlsession
        let (data, response) = try await URLSession.shared.data(for: request)
        // response check
        guard let urlResponse = response as? HTTPURLResponse else {
            throw ManagerErrors.invalidResponse
        }
        // status code check
        if !(200..<300).contains(urlResponse.statusCode) {
            throw ManagerErrors.invalidStatusCode(urlResponse.statusCode)
        }
        // response
        let responseModel = try JSONDecoder().decode(T.self, from: data)
        return responseModel
    }
    
    // request body
    func createBody(boundary: String) -> Data {
        var body = Data()
        body.append("--\(boundary)\r\n".data(using: .utf8)!)
//        body.append("Content-Disposition: form-data; name=\"image\"; filename=\"\(????)\"\r\n".data(using: .utf8)!)
        body.append("Content-Type: image/jpeg\r\n\r\n".data(using: .utf8)!)
//        body.append({image binary data})
        body.append("\r\n".data(using: .utf8)!)
        body.append("--\(boundary)--\r\n".data(using: .utf8)!)
        return body
    }
}
