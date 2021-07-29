//
//  testApp.swift
//  test
//
//  Created by Frank on 2021/7/24.
//

import SwiftUI

var shown : Bool = false

@main
struct testApp: App {
//    var test = Onboard()
//    var show : Bool = false

    var body: some Scene {
        
        WindowGroup {

//            Onboard()
        
            ContentView(chats: ChatList.data)
            
            
//            ContentView(chats: ChatList.data)
            
//            OB_Content()
            
        }
    }
}
