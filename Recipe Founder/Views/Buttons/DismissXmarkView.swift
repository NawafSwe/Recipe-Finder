//
//  DismissXmarkView.swift
//  Recipe Founder
//
//  Created by Nawaf B Al sharqi on 19/11/2020.
//

import SwiftUI

//MARK:- DismissXmarkView
struct DismissXmarkView:View {
    let circleWidth:CGFloat
    let circleHeight:CGFloat
    var body: some View{
        Image(systemName: "xmark")
            .modifier(IconsModifiers(scale: .medium, width: 44, height: 44 , circleWidth: circleWidth,circleHeight: circleHeight))
    }
}

struct DismissXmarkView_Previews: PreviewProvider {
    static var previews: some View {
        DismissXmarkView(circleWidth: 30, circleHeight: 30)
    }
}
