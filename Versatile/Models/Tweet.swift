//
//  Tweet.swift
//  Versatile
//
//  Created by uhooi on 2021/07/21.
//

struct Tweet: Codable {
    let id: String?
    let text: String
    let in_reply_to_user_id: String?
    let in_reply_to_text_id: String?
}
