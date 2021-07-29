//
//  ReflectView.swift
//  test
//
//  Created by Frank on 2021/7/27.
//

import SwiftUI

struct ReflectView: View {
    var body: some View {
        NavigationView{
            
            VStack{
                Text("这件事该怎么处理考虑清楚了吗？")
                    .font(.system(size: 35))
                    .bold()
                    .padding(40)
                    .frame(width: UIScreen.main.bounds.width, height: 400, alignment: .center)
                    .multilineTextAlignment(.center)
                    
                HStack(spacing: 15){
                    Button(action: {}, label: {
                        Text("  Yes😀  ").font(.system(size: 35)).foregroundColor(.white)
                    })
                }
                .background(Color.green)
                .clipShape(RoundedRectangle(cornerRadius: 15))
                .padding(10)
//                .padding()
                
                HStack(spacing: 15){
                    Button(action: {}, label: {
                        Text("  No 😔  ").font(.system(size: 35)).foregroundColor(.white)
                    })
                }
                .background(Color.orange)
                .clipShape(RoundedRectangle(cornerRadius: 15))
                .padding(10)
                Spacer()
            }
            
//            Text("这件事想清楚了吗？")
//                .fontWeight(.semibold)
//                .foregroundColor(Color.blue)
//                .padding()

        }
        
    }
}

struct ReflectView_Previews: PreviewProvider {
    static var previews: some View {
        ReflectView()
    }
}
