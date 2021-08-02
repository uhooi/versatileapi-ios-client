//
//  TweetResponseBody.swift
//  Versatile
//
//  Created by uhooi on 2021/08/02.
//

struct TweetResponseBody: Decodable {
    let id: String
}

extension TweetResponseBody {
    func convertToTweetID() -> TweetID { .init(id: self.id) }
}
