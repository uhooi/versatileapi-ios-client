//
//  VersatileAPIClient.swift
//  Versatile
//
//  Created by uhooi on 2021/07/21.
//

import HTTPClient

final class VersatileAPIClient {
    static let shared = VersatileAPIClient()
    
    private let httpClient = HTTPClient(baseURLString: "https://versatileapi.herokuapp.com/api/")
}

extension VersatileAPIClient: VersatileRepository {
    func registerUser(name: String, description: String, completion: @escaping (Result<UserID, Error>) -> Void) {
        let requestBody = RegisterUserRequestBody(name: name, description: description)
        httpClient.request(RegisterUserRequest(), requestBody: requestBody, completion: completion)
    }
    
    func updateUser(name: String, description: String, completion: @escaping (Result<UserID, Error>) -> Void) {
        let requestBody = UpdateUserRequestBody(name: name, description: description)
        httpClient.request(UpdateUserRequest(), requestBody: requestBody, completion: completion)
    }
    
    func fetchUser(userID: String, completion: @escaping (Result<User, Error>) -> Void) {
        httpClient.request(FetchUserRequest(userID: userID), completion: completion)
    }
    
    func fetchAllUser(_ completion: @escaping (Result<[User], Error>) -> Void) {
        httpClient.request(FetchAllUserRequest(), completion: completion)
    }
    
    func tweet(text: String, completion: @escaping (Result<TweetID, Error>) -> Void) {
        let requestBody = TweetRequestBody(text: text)
        httpClient.request(TweetRequest(), requestBody: requestBody, completion: completion)
    }
    
    func fetchTweet(tweetID: String, completion: @escaping (Result<Tweet, Error>) -> Void) {
        httpClient.request(FetchTweetRequest(tweetID: tweetID), completion: completion)
    }
    
    func fetchAllTweet(_ completion: @escaping (Result<[Tweet], Error>) -> Void) {
        httpClient.request(FetchAllTweetRequest(), completion: completion)
    }
    
}
