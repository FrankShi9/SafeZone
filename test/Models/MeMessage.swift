//
//  MsgModel.swift
//  test
//
//  Created by Frank on 2021/7/29.
//

import SwiftUI

//Msg model and sample data...
struct Message: Identifiable{
    var id = UUID().uuidString
    var message: String
    var userName: String
    var tintColor: Color
    
}

var allMessages : [Message] = [
    Message(message: "Sorry, but I have to fire you.", userName:"Ben", tintColor: .blue),
    






]
