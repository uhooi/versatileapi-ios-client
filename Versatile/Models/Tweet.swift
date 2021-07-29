//
//  Tweet.swift
//  Versatile
//
//  Created by uhooi on 2021/07/21.
//

struct Tweet: Decodable, Identifiable {
    let id: String
    let text: String
    let inReplyToUserId: String?
    let inReplyToTextId: String?
}
