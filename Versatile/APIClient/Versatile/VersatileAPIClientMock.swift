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
        Tweet(id: "001", text: "テスト投稿", in_reply_to_user_id: nil, in_reply_to_text_id: nil),
        Tweet(id: "002", text: "暇なう", in_reply_to_user_id: nil, in_reply_to_text_id: nil),
        Tweet(id: "003", text: "長い文章長い文章長い文章長い文章長い文章長い文章長い文章長い文章長い文章長い文章長い文章長い文章", in_reply_to_user_id: nil, in_reply_to_text_id: nil),
        Tweet(id: "004", text: "おはよ", in_reply_to_user_id: nil, in_reply_to_text_id: nil),
        Tweet(id: "005", text: "こんにちは", in_reply_to_user_id: nil, in_reply_to_text_id: nil),
        Tweet(id: "006", text: "こんばんは", in_reply_to_user_id: nil, in_reply_to_text_id: nil),
        Tweet(id: "007", text: "ねむい", in_reply_to_user_id: nil, in_reply_to_text_id: nil),
        Tweet(id: "008", text: "あ", in_reply_to_user_id: nil, in_reply_to_text_id: nil),
        Tweet(id: "009", text: "うーん", in_reply_to_user_id: nil, in_reply_to_text_id: nil),
        Tweet(id: "010", text: "えー", in_reply_to_user_id: nil, in_reply_to_text_id: nil),
        Tweet(id: "011", text: "テスト投稿", in_reply_to_user_id: nil, in_reply_to_text_id: nil),
        Tweet(id: "012", text: "暇なう", in_reply_to_user_id: nil, in_reply_to_text_id: nil),
        Tweet(id: "013", text: "長い文章長い文章長い文章長い文章長い文章長い文章長い文章長い文章長い文章長い文章長い文章長い文章", in_reply_to_user_id: nil, in_reply_to_text_id: nil),
        Tweet(id: "014", text: "おはよ", in_reply_to_user_id: nil, in_reply_to_text_id: nil),
        Tweet(id: "015", text: "こんにちは", in_reply_to_user_id: nil, in_reply_to_text_id: nil),
        Tweet(id: "016", text: "こんばんは", in_reply_to_user_id: nil, in_reply_to_text_id: nil),
        Tweet(id: "017", text: "ねむい", in_reply_to_user_id: nil, in_reply_to_text_id: nil),
        Tweet(id: "018", text: "あ", in_reply_to_user_id: nil, in_reply_to_text_id: nil),
        Tweet(id: "019", text: "うーん", in_reply_to_user_id: nil, in_reply_to_text_id: nil),
        Tweet(id: "020", text: "えー", in_reply_to_user_id: nil, in_reply_to_text_id: nil),
    ]
}

extension VersatileAPIClientMock: VersatileRepository {
    func registerUser(_ user: User, completion: @escaping (Result<UserID, Error>) -> Void) {
        print("register User \(user)")
        me = User(id: VersatileAPIClientMock.myId.id, name: user.name, description: user.description)
        completion(.success(VersatileAPIClientMock.myId))
    }
    
    func updateUser(_ user: User, completion: @escaping (Result<UserID, Error>) -> Void) {
        print("update User \(user)")
        me = User(id: user.id, name: user.name, description: user.description)
        completion(.success(VersatileAPIClientMock.myId))
    }
    
    func fetchUser(_ userID: String, completion: @escaping (Result<User, Error>) -> Void) {
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
    
    func tweet(_ tweet: Tweet, completion: @escaping (Result<TweetID, Error>) -> Void) {
    }
    
    func fetchTweet(_ tweetID: String, completion: @escaping (Result<Tweet, Error>) -> Void) {
    }
    
    func fetchAllTweet(_ completion: @escaping (Result<[Tweet], Error>) -> Void) {
        completion(.success(tweets))
    }
    
}
