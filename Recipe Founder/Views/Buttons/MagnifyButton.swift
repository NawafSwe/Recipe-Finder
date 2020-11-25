//
//  MagnifyButton.swift
//  Recipe Founder
//
//  Created by Nawaf B Al sharqi on 19/11/2020.
//

import SwiftUI

//MARK:- MagnifyButton
struct MagnifyButton:View {
    var body: some View {
        Image(systemName: "magnifyingglass")
            .modifier(IconsModifiers(scale: .medium, width: 44, height: 44 , circleWidth: 30 , circleHeight: 25))
    }
    
    struct MagnifyButton_Previews: PreviewProvider {
        static var previews: some View {
            MagnifyButton()
        }
    }
    
}
