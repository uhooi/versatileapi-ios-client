//
//  TweetRequest.swift
//  Versatile
//
//  Created by uhooi on 2021/07/25.
//

import HTTPClient

struct TweetRequest: Request {
    typealias ResponseBody = TweetResponseBody
    var path: String { "text" }
    var httpMethod: HTTPMethod { .post }
    var httpHeaders: [HTTPHeaderField: String]? { [
        .contentType: ContentType.applicationJson.rawValue,
        .authorization: TweetRequest.authorization
    ] }
    
    private static let authorization = "HelloWorld"
}
