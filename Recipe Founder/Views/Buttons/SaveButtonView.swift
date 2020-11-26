//
//  SaveButtonView.swift
//  Recipe Founder
//
//  Created by Nawaf B Al sharqi on 25/11/2020.
//

import SwiftUI

struct SaveButtonView: View {
    var body: some View {
        Image(systemName: "heart")
            .foregroundColor(.white)
            .modifier(IconsModifiers(scale: .medium, width: 44, height: 44, circleWidth: 30, circleHeight: 25 , background:.heart))
    }
}

struct SaveButtonView_Previews: PreviewProvider {
    static var previews: some View {
        SaveButtonView()
    }
}
