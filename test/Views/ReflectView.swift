//
//  ReflectView.swift
//  test
//
//  Created by Frank on 2021/7/27.
//

import SwiftUI

struct ReflectView: View {
    var body: some View {
        Text("这件事想清楚了吗？")
        HStack(spacing: 15){
            Button(action: {}, label: {
                Text("Yes").font(.system(size: 22)).foregroundColor(.white)
            })
        }
        .padding(.vertical, 12)
        .padding(.horizontal)
        .background(Color.green)
        .clipShape(Rectangle())
        HStack(spacing: 15){
            Button(action: {}, label: {
                Text("no").font(.system(size: 22)).foregroundColor(.white)
            })
        }
        .padding(.vertical, 12)
        .padding(.horizontal)
        .background(Color.yellow)
        .clipShape(Rectangle())
        
    }
}

struct ReflectView_Previews: PreviewProvider {
    static var previews: some View {
        ReflectView()
    }
}
