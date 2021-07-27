//
//  ChatLIst.swift
//  test
//
//  Created by Frank on 2021/7/24.
//

import SwiftUI


struct ChatList: Identifiable{
    let id: UUID
    var title: String
    var object: String
    var color: Color
    
    init(id: UUID = UUID(), title: String, object: String, color: Color){
        self.id = id
        self.title = title
        self.object = object
        self.color = color
    }
}

extension ChatList{
    static var data: [ChatList]{
        [
            ChatList(title: "To Mia: About the quarrel", object:"Daisy", color: Color("About the proposal")),
//            ChatList(title: "To Ken: About the contract", object:"Daisy", color: Color("About the contract")),
//            ChatList(title: "About the next basketball match", object:"Daisy", color: Color("About the next basketball match"))
        ]
    }
}
