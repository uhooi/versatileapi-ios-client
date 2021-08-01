//
//  TweetView.swift
//  Versatile
//
//  Created by 小鍋涼太 on 2021/07/31.
//

import SwiftUI
import Combine

struct TweetView: View {
    @ObservedObject var viewModel: TweetViewModel
    
    init(
        viewModel: TweetViewModel
    ) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack {
            Text("つぶやく")
            TextEditor(text: $viewModel.tweet)
            Button("OK") {
                viewModel.buttonTapped.send()
            }
        }
    }
}

struct TweetView_Previews: PreviewProvider {
    static var previews: some View {
        TweetView(viewModel: TweetViewModel(apiClient: VersatileAPIClientMock()))
    }
}
