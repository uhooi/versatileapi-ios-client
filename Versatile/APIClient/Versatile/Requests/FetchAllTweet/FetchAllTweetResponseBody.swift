//
//  FetchAllTweetResponseBody.swift
//  Versatile
//
//  Created by uhooi on 2021/08/02.
//

struct FetchAllTweetResponseBody: Decodable {
    let id: String
    let text: String
    let inReplyToUserId: String?
    let inReplyToTextId: String?
}

extension FetchAllTweetResponseBody {
    func convertTweet() -> Tweet { .init(id: self.id, text: self.text, inReplyToUserId: self.inReplyToUserId, inReplyToTextId: self.inReplyToTextId) }
}
