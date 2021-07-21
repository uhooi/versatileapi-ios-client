//
//  VersatileRepository.swift
//  Versatile
//
//  Created by uhooi on 2021/07/21.
//

protocol VersatileRepository {
    func registerUser(_ user: User, completion: Result<Void, Error>)
    func updateUser(_ user: User, completion: Result<Void, Error>)
    func fetchUser(_ userId: String, completion: Result<User, Error>)
    func fetchAllUser(_ completion: Result<[User], Error>)
    func tweet(_ tweet: Tweet, completion: Result<Void, Error>)
    func FetchTweet(_ tweetId: String, completion: Result<Tweet, Error>)
    func FetchAllTweet(_ completion: Result<[Tweet], Error>)
}
