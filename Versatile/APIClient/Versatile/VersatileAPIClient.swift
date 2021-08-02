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
        httpClient.request(RegisterUserRequest(), requestBody: requestBody) { result in
            switch result {
            case let .success(responseBody):
                completion(.success(responseBody.convertUserID()))
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
    
    func updateUser(name: String, description: String, completion: @escaping (Result<UserID, Error>) -> Void) {
        let requestBody = UpdateUserRequestBody(name: name, description: description)
        httpClient.request(UpdateUserRequest(), requestBody: requestBody) { result in
            switch result {
            case let .success(responseBody):
                completion(.success(responseBody.convertUserID()))
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
    
    func fetchUser(userID: String, completion: @escaping (Result<User, Error>) -> Void) {
        httpClient.request(FetchUserRequest(userID: userID)) { result in
            switch result {
            case let .success(responseBody):
                completion(.success(responseBody.convertUser()))
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
    
    func fetchAllUser(_ completion: @escaping (Result<[User], Error>) -> Void) {
        httpClient.request(FetchAllUserRequest()) { result in
            switch result {
            case let .success(responseBody):
                completion(.success(responseBody.map { $0.convertUser() }))
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
    
    func tweet(text: String, completion: @escaping (Result<TweetID, Error>) -> Void) {
        let requestBody = TweetRequestBody(text: text)
        httpClient.request(TweetRequest(), requestBody: requestBody) { result in
            switch result {
            case let .success(responseBody):
                completion(.success(responseBody.convertTweetID()))
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
    
    func fetchTweet(tweetID: String, completion: @escaping (Result<Tweet, Error>) -> Void) {
        httpClient.request(FetchTweetRequest(tweetID: tweetID)) { result in
            switch result {
            case let .success(responseBody):
                completion(.success(responseBody.convertTweet()))
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
    
    func fetchAllTweet(_ completion: @escaping (Result<[Tweet], Error>) -> Void) {
        httpClient.request(FetchAllTweetRequest()) { result in
            switch result {
            case let .success(responseBody):
                completion(.success(responseBody.map { $0.convertTweet() }))
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
    
}
