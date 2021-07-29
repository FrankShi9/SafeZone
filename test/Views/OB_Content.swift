//
//  OB+Content.swift
//  test
//
//  Created by Frank on 2021/7/30.
//

import SwiftUI

struct OB_Content: View {
    var test = Onboard()
//    var show : Bool = false

    var body: some View {
        


//            Onboard()
            test
            if (shown){
                test.hidden()
                ContentView(chats: ChatList.data)
            }
            
//            ContentView(chats: ChatList.data)

            
    }
}

struct OB_Content_Previews: PreviewProvider {
    static var previews: some View {
        OB_Content()
    }
}
