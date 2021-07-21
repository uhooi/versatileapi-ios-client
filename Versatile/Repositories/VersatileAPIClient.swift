//
//  VersatileAPIClient.swift
//  Versatile
//
//  Created by uhooi on 2021/07/21.
//

final class VersatileAPIClient {
}

extension VersatileAPIClient: VersatileRepository {
    func registerUser(_ user: User, completion: Result<Void, Error>) {
        // TODO:
    }
    
    func updateUser(_ user: User, completion: Result<Void, Error>) {
        // TODO:
    }
    
    func fetchUser(_ userId: String, completion: Result<User, Error>) {
        // TODO:
    }
    
    func fetchAllUser(_ completion: Result<[User], Error>) {
        // TODO:
    }
    
    func tweet(_ tweet: Tweet, completion: Result<Void, Error>) {
        // TODO:
    }
    
    func FetchTweet(_ tweetId: String, completion: Result<Tweet, Error>) {
        // TODO:
    }
    
    func FetchAllTweet(_ completion: Result<[Tweet], Error>) {
        // TODO:
    }
}
