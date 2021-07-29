//
//  No.swift
//  test
//
//  Created by Frank on 2021/7/27.
//

import SwiftUI


struct NoView: View {
    var body: some View {
        NavigationView{
            
            VStack{
                Text(" 不用着急，慢慢想。 回看一下当前对话")
                    .font(.system(size: 35))
                    .bold()
                    .padding(49)
                    .frame(width: UIScreen.main.bounds.width, height: 300, alignment: .center)
                    .multilineTextAlignment(.center)
                
                
                HStack(spacing: 15){
                    Button(action: {}, label: {
                        Text("     OK     ").font(.system(size: 35)).foregroundColor(.white).frame(width: 160, height: 90, alignment: .center)
                    })
                }
                .background(Color.green)
                .clipShape(RoundedRectangle(cornerRadius: 15))
                .padding(10)
//                .padding()
                
                Spacer()
            }
            
//            Text("这件事想清楚了吗？")
//                .fontWeight(.semibold)
//                .foregroundColor(Color.blue)
//                .padding()

        }
        
    }
}

struct NoView_Previews: PreviewProvider {
    static var previews: some View {
        NoView()
    }
}


