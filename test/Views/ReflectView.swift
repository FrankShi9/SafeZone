//
//  ReflectView.swift
//  test
//
//  Created by Frank on 2021/7/27.
//

import SwiftUI

struct ReflectView: View {
    var body: some View {
        
            
            VStack{
                Text("这件事该怎么处理考虑清楚了吗？")
                    .font(.system(size: 35))
                    .bold()
                    .padding(40)
                    .frame(width: UIScreen.main.bounds.width, height: 200, alignment: .center)
                    .multilineTextAlignment(.center)
                    
                VStack(spacing: 15){
                    NavigationLink(
                            destination: YesView(),
                            label: {
                                Text("  Yes😀  ").font(.system(size: 35)).foregroundColor(.white)
                            })
                }
                .background(Color.green)
                .clipShape(RoundedRectangle(cornerRadius: 15))
                .padding(10)
//                .padding()
                
                VStack(spacing: 15){

                    NavigationLink(
                            destination: NoView(),
                            label: {
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

struct ReflectView_Previews: PreviewProvider {
    static var previews: some View {
        ReflectView()
    }
}
