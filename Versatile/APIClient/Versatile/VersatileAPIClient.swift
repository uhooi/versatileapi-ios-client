//
//  VersatileAPIClient.swift
//  Versatile
//
//  Created by uhooi on 2021/07/21.
//

final class VersatileAPIClient {
    static let shared = VersatileAPIClient()
    
    private let apiClient = APIClient(baseUrlString: "https://versatileapi.herokuapp.com/api/")
}

extension VersatileAPIClient: VersatileRepository {
    func registerUser(_ user: User, completion: @escaping (Result<UserID, Error>) -> Void) {
        apiClient.request(RegisterUserRequest(requestBody: user), completion: completion)
    }
    
    func updateUser(_ user: User, completion: @escaping (Result<UserID, Error>) -> Void) {
        apiClient.request(UpdateUserRequest(requestBody: user), completion: completion)
    }
    
    func fetchUser(_ userID: String, completion: @escaping (Result<User, Error>) -> Void) {
        apiClient.request(FetchUserRequest(userID: userID), completion: completion)
    }
    
    func fetchAllUser(_ completion: @escaping (Result<[User], Error>) -> Void) {
        apiClient.request(FetchAllUserRequest(), completion: completion)
    }
    
    func tweet(_ tweet: Tweet, completion: @escaping (Result<TweetID, Error>) -> Void) {
        apiClient.request(TweetRequest(requestBody: tweet), completion: completion)
    }
    
    func fetchTweet(_ tweetID: String, completion: @escaping (Result<Tweet, Error>) -> Void) {
        apiClient.request(FetchTweetRequest(tweetID: tweetID), completion: completion)
    }
    
    func fetchAllTweet(_ completion: @escaping (Result<[Tweet], Error>) -> Void) {
        apiClient.request(FetchAllTweetRequest(), completion: completion)
    }
    
}
