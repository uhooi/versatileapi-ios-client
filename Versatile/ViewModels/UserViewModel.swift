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
    
    init() {
        
    }
}
