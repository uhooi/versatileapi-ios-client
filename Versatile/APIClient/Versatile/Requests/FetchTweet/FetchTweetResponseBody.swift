//
//  FetchTweetResponseBody.swift
//  Versatile
//
//  Created by uhooi on 2021/08/02.
//

struct FetchTweetResponseBody: Decodable {
    let id: String
    let text: String
    let inReplyToUserId: String?
    let inReplyToTextId: String?
}

extension FetchTweetResponseBody {
    func convertTweet() -> Tweet { .init(id: self.id, text: self.text, inReplyToUserId: self.inReplyToUserId, inReplyToTextId: self.inReplyToTextId) }
}
