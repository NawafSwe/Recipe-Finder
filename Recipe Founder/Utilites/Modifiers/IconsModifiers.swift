//
//  IconsModifiers.swift
//  Recipe Founder
//
//  Created by Nawaf B Al sharqi on 24/11/2020.
//

import SwiftUI
struct IconsModifiers: ViewModifier{
    let scale:Image.Scale
    let width:CGFloat
    let height:CGFloat
    let circleWidth:CGFloat
    let circleHeight:CGFloat
    let background:Color
    
    
    
    func body(content: Content) -> some View {
        content
            .imageScale(scale)
            // 44 is a touch target
            .frame(width:height, height: width)
            .background(
                Circle()
                    .frame(width: circleWidth, height: circleWidth, alignment: .center)
                    .accentColor(background)
            )
    }
}
