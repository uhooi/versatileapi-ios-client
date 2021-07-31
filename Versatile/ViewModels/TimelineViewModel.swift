//
//  TimelineViewModel.swift
//  Versatile
//
//  Created by 小鍋涼太 on 2021/07/29.
//

import Combine
import Foundation

final class TimelineViewModel: ObservableObject, Identifiable {
    
    @Published var tweets = [Tweet]()
    
    private var disposables = Set<AnyCancellable>()
    
    // input
    let buttonTapped = PassthroughSubject<Void, Never>()
    
    init(apiClient: VersatileRepository) {
        apiClient.fetchAllTweet { result in
            switch result {
            case .success(let tweets):
                DispatchQueue.main.async {
                    self.tweets = tweets
                }
            case .failure:
                // TODO: 失敗通知
                break
            }
        }
    }
}
