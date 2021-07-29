//
//  MsgModel.swift
//  test
//
//  Created by Frank on 2021/7/29.
//

import SwiftUI

//Msg model and sample data...
struct MessageK: Identifiable{
    var id = UUID().uuidString
    var message: String
    var userName: String
    var tintColor: Color
    
}

var allMessages : [MessageK] = [
    MessageK(message: "Sorry, but I have to fire you.", userName:"Ben", tintColor: .green),
    MessageK(message: "I do not believe crown place would be good for our contest!", userName:"Sherlock", tintColor: .red),
    MessageK(message: "Your eye appointment is delayed for another 3 days.", userName:"Clara", tintColor: .purple),
]

struct MessageCardView: View{
    var message: MessageK
    
    var body: some View {
        HStack(spacing: 15){
            Circle()
                .fill(message.tintColor)
                .frame(width: 50, height: 50)
            
            VStack(alignment: .leading, spacing: 8){
                Text(message.userName)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.black)
                Text(message.message)
                    .foregroundColor(.black)
            }
            .foregroundColor(.primary)
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
        }
    }
    
}
