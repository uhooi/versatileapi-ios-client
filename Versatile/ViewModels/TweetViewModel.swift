//
//  TweetViewModel.swift
//  Versatile
//
//  Created by 小鍋涼太 on 2021/07/31.
//

import Foundation
import Combine

final class TweetViewModel: ObservableObject, Identifiable {
    @Published var tweet: String = ""
    let buttonTapped = PassthroughSubject<Void, Never>()
    @Published var isPresented: Bool = false
    
    private var disposables = Set<AnyCancellable>()
    
    init(apiClient: VersatileRepository) {
        buttonTapped
            .sink(receiveValue: { _ in
            apiClient.tweet(text: self.tweet) { result in
                switch result {
                case .success:
                    DispatchQueue.main.async {
                        self.isPresented = false
                        self.tweet = ""
                    }
                    break
                case .failure:
                    // TODO: 失敗を画面に通知
                    break
                }
            }
        })
        .store(in: &disposables)
    }
}
