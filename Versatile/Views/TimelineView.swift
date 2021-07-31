//
//  TimelineView.swift
//  Versatile
//
//  Created by 小鍋涼太 on 2021/07/29.
//

import SwiftUI

struct TimelineView: View {
    @ObservedObject var viewModel: TimelineViewModel
    @ObservedObject var tweetViewModel: TweetViewModel
    
    init(viewModel: TimelineViewModel) {
        self.viewModel = viewModel
        self.tweetViewModel = TweetViewModel(apiClient: VersatileAPIClientMock())
    }
    
    var body: some View {
        VStack {
            ScrollView {
                ForEach(viewModel.tweets, content: TimelineRow.init(tweet:))
            }
            HStack {
                Spacer()
                Button("つぶやく", action: {
                    tweetViewModel.isPresented = true
                })
            }
        }
        .sheet(isPresented: $tweetViewModel.isPresented, content: {
            TweetView(viewModel: tweetViewModel)
        })
    }
}

struct TimelineView_Previews: PreviewProvider {
    static var previews: some View {
        TimelineView(viewModel: TimelineViewModel(apiClient: VersatileAPIClientMock()))
    }
}
