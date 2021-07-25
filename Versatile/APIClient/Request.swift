//
//  Request.swift
//  Versatile
//
//  Created by uhooi on 2021/07/25.
//

import Foundation

protocol Request {
    associatedtype ResponseBody: Decodable
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var queryItems: [URLQueryItem]? { get }
    var httpHeaders: [HTTPHeaderField: String]? { get }
    var requestBody: Encodable? { get }
}

extension Request {
    var queryItems: [URLQueryItem]? { nil }
    var httpHeaders: [HTTPHeaderField: String]? { nil }
    var requestBody: Encodable? { nil }
}

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
}

enum HTTPHeaderField: String {
    case contentType = "Content-Type"
    case authorization = "Authorization"
}

enum ContentType: String {
    case applicationJson = "application/json"
}
