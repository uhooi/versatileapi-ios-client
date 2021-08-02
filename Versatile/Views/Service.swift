//
//  Service.swift
//  Versatile
//
//  Created by uhooi on 2021/07/30.
//

import Foundation

final class Service {
    var uhooi: User?
    var users: [User]?
    var tweets: [Tweet]?
    
    init() {
        VersatileAPIClient.shared.registerUser(name: "test", description: "test") { result in
            switch result {
            case let .success(userID):
                print("userID: \(userID)")
            case let .failure(error):
                print("error: \(error)")
            }
        }
        
        VersatileAPIClient.shared.updateUser(name: "test", description: "testtest") { result in
            switch result {
            case let .success(userID):
                print("userID: \(userID)")
            case let .failure(error):
                print("error: \(error)")
            }
        }
        
        VersatileAPIClient.shared.tweet(text: "uhoooooi") { result in
            switch result {
            case let .success(tweetID):
                print("tweetID: \(tweetID)")
            case let .failure(error):
                print("error: \(error)")
            }
        }
        
        VersatileAPIClient.shared.fetchTweet(tweetID: "05610010-a775-4c37-901f-afd8d2398555") { result in
            switch result {
            case let .success(tweet):
                print("tweet: \(tweet)")
            case let .failure(error):
                print("error: \(error)")
            }
        }
        
        VersatileAPIClient.shared.fetchUser(userID: "d32c4534bf24b713efb9efe619008c5bf9a289cf") { result in
            switch result {
            case let .success(user):
                self.uhooi = user
            case let .failure(error):
                print("error: \(error)")
            }
        }
        
        VersatileAPIClient.shared.fetchAllUser { result in
            switch result {
            case let .success(users):
                self.users = users
            case let .failure(error):
                print("error: \(error)")
            }
        }
        
        VersatileAPIClient.shared.fetchAllTweet { result in
            switch result {
            case let .success(tweets):
                self.tweets = tweets
            case let .failure(error):
                print("error: \(error)")
            }
        }
    }
}
