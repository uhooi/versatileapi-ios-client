//
//  FetchAllTweetRequest.swift
//  Versatile
//
//  Created by uhooi on 2021/07/25.
//

struct FetchAllTweetRequest: Request {
    typealias ResponseBody = [Tweet]
    var path: String { "text/all" }
    var httpMethod: HTTPMethod { .get }
    var httpHeaders: [HTTPHeaderField: String]? { [.contentType: ContentType.applicationJson.rawValue] }
}
