//
//  VersatileRepository.swift
//  Versatile
//
//  Created by uhooi on 2021/07/21.
//

protocol VersatileRepository {
    func registerUser(name: String, description: String, completion: @escaping (Result<UserID, Error>) -> Void)
    func updateUser(name: String, description: String, completion: @escaping (Result<UserID, Error>) -> Void)
    func fetchUser(userID: String, completion: @escaping (Result<User, Error>) -> Void)
    func fetchAllUser(_ completion: @escaping (Result<[User], Error>) -> Void)
    func tweet(text: String, completion: @escaping (Result<TweetID, Error>) -> Void)
    func fetchTweet(tweetID: String, completion: @escaping (Result<Tweet, Error>) -> Void)
    func fetchAllTweet(_ completion: @escaping (Result<[Tweet], Error>) -> Void)
}
