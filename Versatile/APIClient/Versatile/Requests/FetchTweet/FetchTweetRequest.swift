//
//  FetchTweetRequest.swift
//  Versatile
//
//  Created by uhooi on 2021/07/25.
//

import HTTPClient

struct FetchTweetRequest: Request {
    typealias ResponseBody = Tweet
    var path: String { "text/\(tweetID)" }
    var httpMethod: HTTPMethod { .get }
    var httpHeaders: [HTTPHeaderField: String]? { [.contentType: ContentType.applicationJson.rawValue] }
    
    let tweetID: String
}
