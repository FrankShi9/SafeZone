//
//  OffsetModifiers.swift
//  test
//
//  Created by Frank on 2021/7/28.
//

import SwiftUI

//Offset the scrollview

struct OffsetModifier: ViewModifier {
    
    @Binding var offset: CGFloat
    
    func body(content: Content) -> some View {
        content
            .overlay(
                GeometryReader{proxy -> Color in
                    let minY = proxy.frame(in: .global)
                    
                    return Color.clear
                    
                }
            
            )
    }
}

