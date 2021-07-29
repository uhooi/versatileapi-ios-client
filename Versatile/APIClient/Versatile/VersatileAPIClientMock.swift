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
    }
    
}
