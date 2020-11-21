//
//  EmptySavedRecipesStateView.swift
//  Recipe Founder
//
//  Created by Nawaf B Al sharqi on 21/11/2020.
//

import SwiftUI

//MARK:- EmptySavedRecipesStateView
struct EmptySavedRecipesStateView:View {
    var body: some View{
        ZStack{
            VStack(spacing:10){
                Image("shooping")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 300 , height: 300)
                Text("You Do Not Have Saved Recipes Currently Go And Pick Some!")
                    .foregroundColor(.primary)
                    .multilineTextAlignment(.center)
                    .font(.subheadline)
                    .padding()
            }
        }
        .offset(y:-60)
    }
}


struct EmptySavedRecipesStateView_Previews: PreviewProvider {
    static var previews: some View {
        EmptySavedRecipesStateView()
    }
}
