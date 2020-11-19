//
//  SearchRecipeView.swift
//  Recipe Founder
//
//  Created by Nawaf B Al sharqi on 19/11/2020.
//

import SwiftUI

struct SearchRecipeView: View {
    @Binding var dismissView : Bool
    @StateObject private var viewModel = SearchRecipeViewModel()
    
    
    var body: some View {
        ZStack {
            NavigationView{
                List(viewModel.ingredients){ ingredient in
                    Text(ingredient.name)
                }
                
                /// disable list if the user filling new ingredient
                .disabled(viewModel.isShowForm)
                .navigationBarTitle("Search Recipes ☘️")
                .navigationBarItems(leading: horizontalButtonContainers(viewModel: viewModel)
                                    ,trailing:
                                        Button(action:{ self.dismissView.toggle()})
                                            {DismissXmarkView()}
                )
                
               
            }
            .blur(radius: viewModel.isShowForm ? 5 : 0 )
            .shadow(radius:  viewModel.isShowForm ? 10 : 0)
            
            if viewModel.isShowForm{
                InputSearchView(viewModel: viewModel)
                    .transition(.identity)
            }
        }
    }
}

struct SearchRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        SearchRecipeView(dismissView:.constant(false))
            .preferredColorScheme(.dark)
    }
}

//MARK:- horizontalButtonContainers
struct horizontalButtonContainers: View{
    @ObservedObject var viewModel:SearchRecipeViewModel
    var body: some View{
        HStack{
            Button(action:{
                /// do search
            }){ MagnifyButton()}
            Button(action:{
                /// show form
                self.viewModel.isShowForm = true
                
            })
            {  PlusButton() }
        }
    }
}
