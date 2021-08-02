//
//  UpdateUserRequest.swift
//  Versatile
//
//  Created by uhooi on 2021/07/25.
//

import HTTPClient

struct UpdateUserRequest: Request {
    typealias ResponseBody = UpdateUserResponseBody
    var path: String { "user/create_user" }
    var httpMethod: HTTPMethod { .put }
    var httpHeaders: [HTTPHeaderField: String]? { [.contentType: ContentType.applicationJson.rawValue] }
}
