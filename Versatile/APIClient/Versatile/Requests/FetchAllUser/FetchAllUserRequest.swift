//
//  FetchAllUserRequest.swift
//  Versatile
//
//  Created by uhooi on 2021/07/25.
//

struct FetchAllUserRequest: Request {
    typealias ResponseBody = [User]
    var path: String { "user/all" }
    var httpMethod: HTTPMethod { .get }
    var httpHeaders: [HTTPHeaderField: String]? { [.contentType: ContentType.applicationJson.rawValue] }
}
