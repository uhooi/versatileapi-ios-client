//
//  FetchAllTweetRequest.swift
//  Versatile
//
//  Created by uhooi on 2021/07/25.
//

import HTTPClient

struct FetchAllTweetRequest: Request {
    typealias ResponseBody = [FetchAllTweetResponseBody]
    var path: String { "text/all" }
    var httpMethod: HTTPMethod { .get }
    var httpHeaders: [HTTPHeaderField: String]? { [.contentType: ContentType.applicationJson.rawValue] }
}
