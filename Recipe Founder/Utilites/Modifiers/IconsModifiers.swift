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
    
    func body(content: Content) -> some View {
        content
            //.label black in white mode and white in dark mode
            .foregroundColor(Color(.label))
            .imageScale(scale)
            // 44 is a touch target
            .frame(width:height, height: width)
            .background(Color.iconsBackground)
    }
}
