//
//  TimelineRow.swift
//  Versatile
//
//  Created by 小鍋涼太 on 2021/07/29.
//

import SwiftUI

struct TimelineRow: View {
    var tweet: Tweet
    
    var body: some View {
        HStack {
            Text(tweet.text)
                .padding(EdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20))
            Spacer()
        }
    }
}

struct TimelineRow_Previews: PreviewProvider {
    static var previews: some View {
        TimelineRow(tweet: Tweet(id: "001", text: "暇なう", in_reply_to_user_id: nil, in_reply_to_text_id: nil))
            .previewLayout(.sizeThatFits)
    }
}
