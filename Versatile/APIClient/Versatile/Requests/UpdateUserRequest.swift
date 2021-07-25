//
//  UpdateUserRequest.swift
//  Versatile
//
//  Created by uhooi on 2021/07/25.
//

struct UpdateUserRequest: Request {
    typealias ResponseBody = UserID
    var path: String { "user/create_user" }
    var httpMethod: HTTPMethod { .put }
    var httpHeaders: [HTTPHeaderField: String]? { [.contentType: ContentType.applicationJson.rawValue] }
    let requestBody: User
}
