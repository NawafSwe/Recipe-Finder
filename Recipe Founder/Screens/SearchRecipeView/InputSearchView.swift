//
//  InputSearchView.swift
//  Recipe Founder
//
//  Created by Nawaf B Al sharqi on 19/11/2020.
//

import SwiftUI

struct InputSearchView: View {
    @State var ingredientInput:String = ""
    @Binding var dismissView: Bool
    
    var body: some View {
        VStack {
            Text("Tell Me What You have 🤥")
                .font(.title2)
                .padding()
            TextField( "Ingredient Goes Here", text: $ingredientInput)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .frame(width:300)
            Button{
                /// add the ingredient to the list
                
            }label:{
                Text("Add")
                    .frame(width: 220, height: 50, alignment: .center)
                    .accentColor(.white)
                    .background(Color.tabItemColor)
                    .cornerRadius(30)
            }
            .padding()
        }
        .frame(width:320, height: 300)
        .background(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
        .cornerRadius(40)
        .shadow(radius: 12)
        .overlay(
            Button{
                dismissView.toggle()
            }label:{
            DismissXmarkView()
                .padding(.horizontal,5)
                .padding(.vertical,3)
                
            }
                  , alignment: .topTrailing)
    }
}

struct InputSearchView_Previews: PreviewProvider {
    static var previews: some View {
        InputSearchView(dismissView: .constant(false))
    }
}
