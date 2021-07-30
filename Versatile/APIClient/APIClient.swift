//
//  APIClient.swift
//  Versatile
//
//  Created by uhooi on 2021/07/21.
//

import Foundation

final class APIClient {
    
    // MARK: Stored Instance Properties
    
    private let baseURLString: String
    
    // MARK: Initializers
    
    init(baseURLString: String) {
        self.baseURLString = baseURLString
    }
    
    // MARK: Other Internal Methods
    
    func request<T: Request>(_ requestContents: T, completion: @escaping (Result<T.ResponseBody, Error>) -> Void) {
        var request: URLRequest
        do {
            request = try createRequest(requestContents)
        } catch let error {
            completion(.failure(error))
            return
        }
        request.httpBody = requestContents.requestBody?.toJSONData()
        
        self.request(requestContents, request: request, completion: completion)
    }
    
    // MARK: Other Private Methods
    
    private func createRequest<T: Request>(_ requestContents: T) throws -> URLRequest {
        guard let url = URL(string: baseURLString + requestContents.path),
              var components = URLComponents(url: url, resolvingAgainstBaseURL: url.baseURL != nil)
        else {
            throw RequestError.invalidUrl
        }
        
        if let queryItems = requestContents.queryItems {
            components.queryItems = queryItems + (components.queryItems ?? [])
        }
        
        var request = URLRequest(url: components.url!)
        request.httpMethod = requestContents.httpMethod.rawValue
        if let httpHeaders = requestContents.httpHeaders {
            for (field, value) in httpHeaders {
                request.addValue(value, forHTTPHeaderField: field.rawValue)
            }
        }
        
        return request
    }
    
    private func request<T: Request>(_ requestContents: T, request: URLRequest, completion: @escaping (Result<T.ResponseBody, Error>) -> Void) {
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let response = response as? HTTPURLResponse else {
                completion(.failure(RequestError.invalidResponse))
                return
            }
            if let requestError = self.validateStatusCode(response.statusCode) {
                completion(.failure(requestError))
                return
            }
            guard let data = data else {
                completion(.failure(RequestError.invalidData))
                return
            }
            do {
                let jsonDecoder = JSONDecoder()
                jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
                let responseBody = try jsonDecoder.decode(T.ResponseBody.self, from: data)
                completion(.success(responseBody))
                return
            } catch let error {
                completion(.failure(error))
                return
            }
        }.resume()
    }
    
    private func validateStatusCode(_ statusCode: Int) -> RequestError? {
        switch statusCode {
        case 200..<300:
            return nil
        case 300..<400:
            return .redirection(statusCode)
        case 400..<500:
            return .clientError(statusCode)
        case 500..<600:
            return .serverError(statusCode)
        default:
            return .invalidStatusCode(statusCode)
        }
    }
}

enum RequestError: Error {
    case invalidUrl
    case invalidData
    case invalidResponse
    case redirection(_ statusCode: Int)
    case clientError(_ statusCode: Int)
    case serverError(_ statusCode: Int)
    case invalidStatusCode(_ statusCode: Int)
}
