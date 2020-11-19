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
            //.label black in white mode and white in dark mode
            .foregroundColor(Color(.label))
            .imageScale(.small)
            // 44 is a touch target
            .frame(width:44, height: 44)
    }
}

struct DismissXmarkView_Previews: PreviewProvider {
    static var previews: some View {
        DismissXmarkView()
    }
}
