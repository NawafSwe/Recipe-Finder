//
//  MagnifyButtonView.swift
//  Recipe Founder
//
//  Created by Nawaf B Al sharqi on 19/11/2020.
//

import SwiftUI

//MARK:- MagnifyButtonView
struct MagnifyButtonView:View {
    var body: some View {
        Image(systemName: "magnifyingglass")
            //.label black in white mode and white in dark mode
            .foregroundColor(Color(.systemBackground))
            .modifier(IconsModifiers(scale: .medium, width: 44, height: 44 , circleWidth: 30 , circleHeight: 25,background: .iconsBackground))
    }
    
    struct MagnifyButton_Previews: PreviewProvider {
        static var previews: some View {
            MagnifyButtonView()
        }
    }
    
}
