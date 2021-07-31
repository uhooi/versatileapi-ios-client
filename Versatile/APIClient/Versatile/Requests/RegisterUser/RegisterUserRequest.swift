//
//  RegisterUserRequest.swift
//  Versatile
//
//  Created by uhooi on 2021/07/25.
//

import HTTPClient

struct RegisterUserRequest: Request {
    typealias ResponseBody = UserID
    var path: String { "user/create_user" }
    var httpMethod: HTTPMethod { .post }
    var httpHeaders: [HTTPHeaderField: String]? { [.contentType: ContentType.applicationJson.rawValue] }
}
