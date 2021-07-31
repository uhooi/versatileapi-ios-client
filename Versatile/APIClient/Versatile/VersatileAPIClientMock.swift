//
//  VersatileAPIClientMock.swift
//  Versatile
//
//  Created by 小鍋涼太 on 2021/07/29.
//

import Foundation

final class VersatileAPIClientMock {
    static let shared = VersatileAPIClientMock()
    
    private var me: User?
    static let myId = UserID(id: "myId")
    private var users = [
        User(id: "001", name: "First Taro", description: "はじめまして"),
        User(id: "002", name: "Second Hanako", description: "Nice to meet you."),
        User(id: "003", name: "Third sado", description: "Kennenzulernen")
    ]
    private var tweets = [
        Tweet(id: "001", text: "テスト投稿", inReplyToUserId: nil, inReplyToTextId: nil),
        Tweet(id: "002", text: "暇なう", inReplyToUserId: nil, inReplyToTextId: nil),
        Tweet(id: "003", text: "長い文章長い文章長い文章長い文章長い文章長い文章長い文章長い文章長い文章長い文章長い文章長い文章", inReplyToUserId: nil, inReplyToTextId: nil),
        Tweet(id: "004", text: "おはよ", inReplyToUserId: nil, inReplyToTextId: nil),
        Tweet(id: "005", text: "こんにちは", inReplyToUserId: nil, inReplyToTextId: nil),
        Tweet(id: "006", text: "こんばんは", inReplyToUserId: nil, inReplyToTextId: nil),
        Tweet(id: "007", text: "ねむい", inReplyToUserId: nil, inReplyToTextId: nil),
        Tweet(id: "008", text: "あ", inReplyToUserId: nil, inReplyToTextId: nil),
        Tweet(id: "009", text: "うーん", inReplyToUserId: nil, inReplyToTextId: nil),
        Tweet(id: "010", text: "えー", inReplyToUserId: nil, inReplyToTextId: nil),
        Tweet(id: "011", text: "テスト投稿", inReplyToUserId: nil, inReplyToTextId: nil),
        Tweet(id: "012", text: "暇なう", inReplyToUserId: nil, inReplyToTextId: nil),
        Tweet(id: "013", text: "長い文章長い文章長い文章長い文章長い文章長い文章長い文章長い文章長い文章長い文章長い文章長い文章", inReplyToUserId: nil, inReplyToTextId: nil),
        Tweet(id: "014", text: "おはよ", inReplyToUserId: nil, inReplyToTextId: nil),
        Tweet(id: "015", text: "こんにちは", inReplyToUserId: nil, inReplyToTextId: nil),
        Tweet(id: "016", text: "こんばんは", inReplyToUserId: nil, inReplyToTextId: nil),
        Tweet(id: "017", text: "ねむい", inReplyToUserId: nil, inReplyToTextId: nil),
        Tweet(id: "018", text: "あ", inReplyToUserId: nil, inReplyToTextId: nil),
        Tweet(id: "019", text: "うーん", inReplyToUserId: nil, inReplyToTextId: nil),
        Tweet(id: "020", text: "えー", inReplyToUserId: nil, inReplyToTextId: nil),
    ]
}

extension VersatileAPIClientMock: VersatileRepository {
    func registerUser(name: String, description: String, completion: @escaping (Result<UserID, Error>) -> Void) {
        print("register name \(name)")
        me = User(id: VersatileAPIClientMock.myId.id, name: name, description: description)
        completion(.success(VersatileAPIClientMock.myId))
    }
    
    func updateUser(name: String, description: String, completion: @escaping (Result<UserID, Error>) -> Void) {
        print("update name \(name)")
        me = User(id: VersatileAPIClientMock.myId.id, name: name, description: description)
        completion(.success(VersatileAPIClientMock.myId))
    }
    
    func fetchUser(userID: String, completion: @escaping (Result<User, Error>) -> Void) {
        let user = users.first(where: {$0.id == userID})
        guard let user = user else {
            completion(.failure(NSError()))
            return
        }
        completion(.success(user))
    }
    
    func fetchAllUser(_ completion: @escaping (Result<[User], Error>) -> Void) {
        completion(.success(users))
    }
    
    func tweet(text: String, completion: @escaping (Result<TweetID, Error>) -> Void) {
    }
    
    func fetchTweet(tweetID: String, completion: @escaping (Result<Tweet, Error>) -> Void) {
    }
    
    func fetchAllTweet(_ completion: @escaping (Result<[Tweet], Error>) -> Void) {
        VersatileAPIClient.shared.fetchAllTweet { result in
            completion(result)
        }
    }
    
}
