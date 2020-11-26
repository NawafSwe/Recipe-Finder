//
//  SearchRecipeLottieView.swift
//  Recipe Founder
//
//  Created by Nawaf B Al sharqi on 27/11/2020.
//

import SwiftUI

struct SearchRecipeLottieView:View{
    var body: some View{
        VStack{
            LottieView(fileName: LottieFiles.searchMagnify)
        }
        .frame(width: 300, height: 300, alignment: .center)
        .background(BlurView(style: .systemMaterial))
        .cornerRadius(25)
        .shadow(radius: 5)
    }
}

struct SearchRecipeLottieView_Previews: PreviewProvider {
    static var previews: some View {
        SearchRecipeLottieView()
    }
}
