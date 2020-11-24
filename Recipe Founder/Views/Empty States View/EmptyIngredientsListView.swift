//
//  EmptyIngredientsListView.swift
//  Recipe Founder
//
//  Created by Nawaf B Al sharqi on 24/11/2020.
//

import SwiftUI

struct EmptyIngredientsListView: View {
    var body: some View {
        ZStack{
            VStack(spacing:10){
                Image("Looking")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 300 , height: 300)
                Text("Please Fill Ingredients List To be able to search Recipes 😆!")
                    .foregroundColor(.primary)
                    .multilineTextAlignment(.center)
                    .font(.subheadline)
                    .padding()
            }
        }
        .offset(y:-60)
    }
}

struct EmptyIngredientsListView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyIngredientsListView()
    }
}
