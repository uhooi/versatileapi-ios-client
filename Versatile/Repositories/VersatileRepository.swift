//
//  VersatileRepository.swift
//  Versatile
//
//  Created by uhooi on 2021/07/21.
//

protocol VersatileRepository {
    func registerUser(_ user: User, completion: @escaping (Result<UserID, Error>) -> Void)
    func updateUser(_ user: User, completion: @escaping (Result<UserID, Error>) -> Void)
    func fetchUser(_ userID: String, completion: @escaping (Result<User, Error>) -> Void)
    func fetchAllUser(_ completion: @escaping (Result<[User], Error>) -> Void)
    func tweet(_ tweet: Tweet, completion: @escaping (Result<TweetID, Error>) -> Void)
    func fetchTweet(_ tweetID: String, completion: @escaping (Result<Tweet, Error>) -> Void)
    func fetchAllTweet(_ completion: @escaping (Result<[Tweet], Error>) -> Void)
}
