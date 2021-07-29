//
//  TweetRequest.swift
//  Versatile
//
//  Created by uhooi on 2021/07/25.
//

struct TweetRequest: Request {
    typealias ResponseBody = TweetID
    var path: String { "text" }
    var httpMethod: HTTPMethod { .post }
    var httpHeaders: [HTTPHeaderField: String]? { [
        .contentType: ContentType.applicationJson.rawValue,
        .authorization: TweetRequest.authorization
    ] }
    let requestBody: TweetRequestBody
    
    private static let authorization = "HelloWorld"
}
