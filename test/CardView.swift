//
//  CardView.swift
//  test
//
//  Created by Frank on 2021/7/24.
//

import SwiftUI

struct CardView: View {
    let chat: ChatList
    var body: some View {
        
        Image("ChatObjectIcon")
            .resizable()
            .frame(width: 60, height: 60)
            .clipShape(Circle())
        
        VStack(alignment: .leading){
            Text(chat.title).font(.headline)
            Spacer()
            .font(.caption)
            
        }
        .padding()
        .foregroundColor(Color.blue)
        
    }
}

struct CardView_Previews: PreviewProvider {
    static var chat = ChatList.data[0]
    static var previews: some View {
        CardView(chat: chat)
            .background(chat.color)
            .previewLayout(.fixed(width: 400, height: 60))
    }
}

