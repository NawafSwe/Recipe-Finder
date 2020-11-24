//
//  DismissXmarkView.swift
//  Recipe Founder
//
//  Created by Nawaf B Al sharqi on 19/11/2020.
//

import SwiftUI

//MARK:- DismissXmarkView
struct DismissXmarkView:View {
    var body: some View{
        Image(systemName: "xmark")
            .modifier(IconsModifiers(scale: .small, width: 44, height: 44))
    }
}

struct DismissXmarkView_Previews: PreviewProvider {
    static var previews: some View {
        DismissXmarkView()
    }
}
