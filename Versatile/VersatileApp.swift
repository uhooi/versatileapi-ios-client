//
//  VersatileApp.swift
//  Versatile
//
//  Created by uhooi on 2021/07/21.
//

import SwiftUI

@main
struct VersatileApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                UserView(viewModel: UserViewModel(apiClient: VersatileAPIClientMock()))
            }
        }
    }
}
