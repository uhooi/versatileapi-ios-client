//
//  UserView.swift
//  Versatile
//
//  Created by 小鍋涼太 on 2021/07/29.
//

import SwiftUI
import Combine

struct UserView: View {
    @ObservedObject var viewModel: UserViewModel
    
    init(viewModel: UserViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack {
            NavigationLink(
                destination: TimelineView(),
                isActive: $viewModel.willNavigateToTimeline) {
                EmptyView()
            }
            Text("ユーザー登録")
                .padding(EdgeInsets(top: 100, leading: 0, bottom: 100, trailing: 0))
                .font(.title)
            Spacer()
            Text("名前")
            TextField("名前", text: $viewModel.name)
            Spacer()
            Text("プロフィール")
            TextEditor(text: $viewModel.description)
                .lineLimit(10)
            .frame(maxHeight: 300)
            Spacer()
            Button("登録", action: {
                viewModel.buttonTapped.send()
            })
        }
        .padding(EdgeInsets(top: 0, leading: 30, bottom: 0, trailing: 30))
    }
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView(viewModel: UserViewModel(apiClient: VersatileAPIClientMock()))
    }
}
