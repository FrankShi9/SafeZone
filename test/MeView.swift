//
//  MeView.swift
//  test
//
//  Created by Frank on 2021/7/26.
//

import SwiftUI


struct MeView: View {
    
    var body: some View{
        
        HStack(alignment: .center, spacing: 15){
            Text("请笑对人生！").font(.headline)
        }
        
    }
}

struct MeView_Previews: PreviewProvider {
    static var chat = ChatList.data[0]
    static var previews: some View {
        MeView()
            .background(Color.black)
//            .previewLayout(.fixed(width: 400, height: 200))
    }
}
