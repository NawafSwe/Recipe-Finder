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
            //.label black in white mode and white in dark mode
            .foregroundColor(Color(.label))
            .imageScale(.medium)
            // 44 is a touch target
            .frame(width:44, height: 44)
    }
}


struct PlusButton_Previews: PreviewProvider {
    static var previews: some View {
        PlusButton()
    }
}
