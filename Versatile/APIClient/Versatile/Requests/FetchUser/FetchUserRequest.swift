//
//  FetchUserRequest.swift
//  Versatile
//
//  Created by uhooi on 2021/07/25.
//

struct FetchUserRequest: Request {
    typealias ResponseBody = User
    var path: String { "user/\(userID)" }
    var httpMethod: HTTPMethod { .get }
    var httpHeaders: [HTTPHeaderField: String]? { [.contentType: ContentType.applicationJson.rawValue] }
    
    let userID: String
}

