//
//  APIClient.swift
//  Versatile
//
//  Created by uhooi on 2021/07/21.
//

import Foundation

final class APIClient {
    
    // MARK: Stored Instance Properties
    
    private let baseUrlString: String
    
    // MARK: Initializers
    
    init(baseUrlString: String) {
        self.baseUrlString = baseUrlString
    }
    
    // MARK: Other Internal Methods
    
    func request<T: Request>(_ requestContents: T, completion: @escaping (Result<T.ResponseBody, Error>) -> Void) {
        guard let url = URL(string: baseUrlString + requestContents.path),
              var components = URLComponents(url: url, resolvingAgainstBaseURL: url.baseURL != nil)
        else {
            completion(.failure(RequestError.invalidUrl))
            return
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
        request.httpBody = requestContents.requestBody?.toJSONData()
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let data = data else {
                completion(.failure(RequestError.invalidData))
                return
            }
            do {
                let responseBody = try JSONDecoder().decode(T.ResponseBody.self, from: data)
                completion(.success(responseBody))
                return
            } catch let error {
                completion(.failure(error))
                return
            }
        }.resume()
    }
}

enum RequestError: Error {
    case invalidUrl
    case invalidData
}
