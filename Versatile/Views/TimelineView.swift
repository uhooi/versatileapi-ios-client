//
//  TimelineView.swift
//  Versatile
//
//  Created by 小鍋涼太 on 2021/07/29.
//

import SwiftUI

struct TimelineView: View {
    @ObservedObject var viewModel: TimelineViewModel
    
    init(viewModel: TimelineViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ScrollView {
            ForEach(viewModel.tweets, content: TimelineRow.init(tweet:))
        }
        HStack {
            Spacer()
            Button("つぶやく", action: {})
        }
    }
}

struct TimelineView_Previews: PreviewProvider {
    static var previews: some View {
        TimelineView(viewModel: TimelineViewModel(apiClient: VersatileAPIClientMock()))
    }
}
