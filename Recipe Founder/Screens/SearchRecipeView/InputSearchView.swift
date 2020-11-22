//
//  InputSearchView.swift
//  Recipe Founder
//
//  Created by Nawaf B Al sharqi on 19/11/2020.
//

import SwiftUI
struct InputSearchView: View {
    @ObservedObject var viewModel: SearchRecipeViewModel
    var body: some View {
        VStack {
            Text("Tell Me What You Have 🥰")
                .font(.title2)
                .padding()
            TextField( "Ingredient Goes Here", text: $viewModel.ingredientInput)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .frame(width:300)
            Button{
                
                DispatchQueue.main.async {
                    /// add the ingredient to the list
                    viewModel.addIngredients(viewModel.ingredientInput)
                    
                    /// clear text
                    viewModel.ingredientInput = ""
                    
                    /// after adding a new ingredient dismiss from the view
                    viewModel.isShowForm = false
                }
            }label:{
                Text("Add")
                    .frame(width: 190, height: 50, alignment: .center)
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
                //to dismiss form
                DispatchQueue.main.async {
                    viewModel.isShowForm = false
                }
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
        InputSearchView(viewModel: SearchRecipeViewModel())
    }
}
