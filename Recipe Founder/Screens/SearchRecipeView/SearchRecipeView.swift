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
            
            NavigationView {
                ZStack{
                    List{
                        ForEach(viewModel.ingredients){ ingredient in
                            Text(ingredient.name)
                        }
                        /// deleting items by swipe
                        .onDelete(perform: viewModel.removeIngredient)
                        /// on the list itsself
                        .blur(radius: viewModel.isShowForm ? 5 : 0 )
                        .shadow(radius:  viewModel.isShowForm ? 10 : 0)
                    }
                    
                    /// changing style list
                    .listStyle(PlainListStyle())
                    /// disable list if the user filling new ingredient
                    .disabled(viewModel.isShowForm)
                    
                    
                    /// if there is an error from the list or on the network call
                    .alert(item: $viewModel.alertItem){ alert in
                        Alert(title: alert.title, message: alert.message, dismissButton: alert.dismissButton)
                        
                    }
                    
                    /// if empty list
                    if viewModel.ingredients.isEmpty{
                        EmptyIngredientsListView()
                            .blur(radius: viewModel.isShowForm ? 5 : 0 )
                            .shadow(radius:  viewModel.isShowForm ? 10 : 0)
                    }
                    
                    if viewModel.isShowForm{
                        InputSearchView(viewModel: viewModel)
                            .transition(.move(edge: .top))
                            .animation(.easeOut(duration: 0.1))
                            .animation(nil)
                    }
                    
                    if viewModel.isLoading{
                        SearchRecipeLottieView()
                    }
                    
                    
                }
                .navigationBarTitle("Search Recipes ☘️")
                .navigationBarItems(leading: horizontalButtonContainers(viewModel: viewModel, showResult: $viewModel.showResults)
                                    ,trailing:
                                        Button(action:{ self.dismissView.toggle()})
                                            {DismissXmarkView()}
                )
            }
            /// if the result fetched
            if viewModel.showResults{
                /// to cover all the page
                Color(.systemBackground)
                    .edgesIgnoringSafeArea(.all)
                RecipeResultsView(dissmiss: $viewModel.showResults, recipes: $viewModel.recipes)
                    //.transition(.move(edge: .top))
                    //.animation(.easeOut(duration: 0.1))
                    .animation(nil)
            }
        }
    }
}
struct SearchRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        SearchRecipeView(dismissView:.constant(false))
            .preferredColorScheme(.light)
    }
}

//MARK:- horizontalButtonContainers
struct horizontalButtonContainers: View{
    @ObservedObject var viewModel:SearchRecipeViewModel
    @Binding var showResult: Bool
    var body: some View{
        HStack{
            Button(action:{
                /// do search
                viewModel.fetchRecipes(ingredients: viewModel.ingredientsStrings)
            }){ MagnifyButton()}
            Button(action:{
                /// show form
                self.viewModel.isShowForm = true
                
            })
            {  PlusButton() }
        }
    }
}
//MARK:- XmarkDismiss nav view
struct DismissNavigationView:View{
    var body: some View{
        Text("Dismiss")
    }
}
