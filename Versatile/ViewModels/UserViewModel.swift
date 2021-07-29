//
//  UserViewModel.swift
//  Versatile
//
//  Created by 小鍋涼太 on 2021/07/29.
//

import Combine

final class UserViewModel: ObservableObject, Identifiable {
    @Published var name: String = ""
    @Published var description: String = ""
    
    private var disposables = Set<AnyCancellable>()
    
    // input
    let buttonTapped = PassthroughSubject<Void, Never>()
    
    // output
    let navigateToTimeline = PassthroughSubject<Void, Never>()
    
    init(apiClient: VersatileRepository) {
        buttonTapped.sink(receiveValue: { _ in
            apiClient.registerUser(User(id: nil, name: self.name, description: self.description)) { result in
                switch result {
                case .success:
                    // TODO: Idをローカルに保存
                    self.navigateToTimeline.send(())
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

