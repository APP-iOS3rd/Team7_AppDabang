//
//  NetworkManager.swift
//  MentoringAPI
//
//  Created by phang on 11/9/23.
//

import Foundation

// MARK: - 네트워크 매니저
class NetworkManager {
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
                               httpMethod: HttpMethod = .post,
                               imageData: Data) async throws -> T {
        // url
        guard let url = URL(string: urlString) else {
            throw Errors.invalidURL
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
        request.addValue("96703", forHTTPHeaderField: "Content-Length")
        // multipart body
        request.httpBody = createBody(boundary: boundary, imageData: imageData)
        // urlsession
        let (data, response) = try await URLSession.shared.data(for: request)
        // response check
        guard let urlResponse = response as? HTTPURLResponse else {
            throw Errors.invalidResponse
        }
        // status code check
        if !(200..<300).contains(urlResponse.statusCode) {
            throw Errors.invalidStatusCode(urlResponse.statusCode)
        }
        // response
        let responseModel = try JSONDecoder().decode(T.self, from: data)
        return responseModel
    }
    
    // request body
    func createBody(boundary: String, imageData: Data) -> Data {
        var body = Data()
        body.append("--\(boundary)\r\n".data(using: .utf8)!)
        body.append("Content-Disposition: form-data; name=\"image\"; filename=\"test.jpg\"\r\n".data(using: .utf8)!)
        body.append("Content-Type: image/jpeg\r\n\r\n".data(using: .utf8)!)
        body.append(imageData)
        body.append("\r\n".data(using: .utf8)!)
        body.append("--\(boundary)--\r\n".data(using: .utf8)!)
        return body
    }
}
