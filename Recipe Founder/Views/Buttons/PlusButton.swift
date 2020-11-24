//
//  PlusButton.swift
//  Recipe Founder
//
//  Created by Nawaf B Al sharqi on 19/11/2020.
//

import SwiftUI

//MARK:- PlusButton
struct PlusButton:View{
    var body: some View{
        Image(systemName: "plus")
            .modifier(IconsModifiers(scale: .medium, width: 44, height: 44))
    }
}
struct PlusButton_Previews: PreviewProvider {
    static var previews: some View {
        PlusButton()
    }
}
