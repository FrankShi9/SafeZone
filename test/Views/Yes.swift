//
//  Yes.swift
//  test
//
//  Created by Frank on 2021/7/27.
//

import SwiftUI


struct YesView: View {
    var body: some View {
        NavigationView{
            
            VStack{
                Text("恭喜！安全区助你时刻保持冷静，此对话会被移动到已解决历史")
                    .font(.system(size: 35))
                    .bold()
                    .padding(20)
                    .frame(width: UIScreen.main.bounds.width, height: 300, alignment: .center)
                    .multilineTextAlignment(.center)
                    
                Text("累计解压 +1")
                    .font(.title)
                    .padding(20)
                
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

struct YesView_Previews: PreviewProvider {
    static var previews: some View {
        YesView()
    }
}

