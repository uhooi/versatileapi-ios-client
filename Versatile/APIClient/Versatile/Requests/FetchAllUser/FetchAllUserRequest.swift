//
//  FetchAllUserRequest.swift
//  Versatile
//
//  Created by uhooi on 2021/07/25.
//

import HTTPClient

struct FetchAllUserRequest: Request {
    typealias ResponseBody = [FetchAllUserResponseBody]
    var path: String { "user/all" }
    var httpMethod: HTTPMethod { .get }
    var httpHeaders: [HTTPHeaderField: String]? { [.contentType: ContentType.applicationJson.rawValue] }
}
