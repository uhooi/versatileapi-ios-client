//
//  VersatileAPIClient.swift
//  Versatile
//
//  Created by uhooi on 2021/07/21.
//

final class VersatileAPIClient {
    static let shared = VersatileAPIClient()
    
    private let apiClient = APIClient(baseURLString: "https://versatileapi.herokuapp.com/api/")
}

extension VersatileAPIClient: VersatileRepository {
    func registerUser(name: String, description: String, completion: @escaping (Result<UserID, Error>) -> Void) {
        let requestBody = RegisterUserRequestBody(name: name, description: description)
        apiClient.request(RegisterUserRequest(requestBody: requestBody), completion: completion)
    }
    
    func updateUser(name: String, description: String, completion: @escaping (Result<UserID, Error>) -> Void) {
        let requestBody = UpdateUserRequestBody(name: name, description: description)
        apiClient.request(UpdateUserRequest(requestBody: requestBody), completion: completion)
    }
    
    func fetchUser(userID: String, completion: @escaping (Result<User, Error>) -> Void) {
        apiClient.request(FetchUserRequest(userID: userID), completion: completion)
    }
    
    func fetchAllUser(_ completion: @escaping (Result<[User], Error>) -> Void) {
        apiClient.request(FetchAllUserRequest(), completion: completion)
    }
    
    func tweet(text: String, completion: @escaping (Result<TweetID, Error>) -> Void) {
        let requestBody = TweetRequestBody(text: text)
        apiClient.request(TweetRequest(requestBody: requestBody), completion: completion)
    }
    
    func fetchTweet(tweetID: String, completion: @escaping (Result<Tweet, Error>) -> Void) {
        apiClient.request(FetchTweetRequest(tweetID: tweetID), completion: completion)
    }
    
    func fetchAllTweet(_ completion: @escaping (Result<[Tweet], Error>) -> Void) {
        apiClient.request(FetchAllTweetRequest(), completion: completion)
    }
    
}
