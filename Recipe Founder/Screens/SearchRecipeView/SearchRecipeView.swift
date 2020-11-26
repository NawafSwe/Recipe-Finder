//
//  SearchRecipeView.swift
//  Recipe Founder
//
//  Created by Nawaf B Al sharqi on 19/11/2020.
//
import SwiftUI
struct SearchRecipeView: View {
    @ObservedObject var viewModel: SearchRecipeViewModel
    var body: some View {
        ZStack {
            NavigationView {
                ZStack{
                    List{
                        ForEach(viewModel.ingredients){ ingredient in
                            Text(ingredient.name)
                        }
                        
                        /// Deleting items by swipe
                        .onDelete(perform: viewModel.removeIngredient)
                        /// on the list itself
                        .blur(radius: viewModel.isShowForm ? 5 : 0 )
                        .shadow(radius:  viewModel.isShowForm ? 10 : 0)
                        
                    }
                    
                    /// Changing style list
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
                    /// showing the form  of the input
                    if viewModel.isShowForm{
                        InputSearchView(viewModel: viewModel)
                            .transition(.move(edge: .top))
                            .animation(.easeOut(duration: 0.1))
                            .animation(nil)
                    }
                    
                    /// showing the loading if the user hit the search button
                    if viewModel.isLoading{
                        SearchRecipeLottieView()
                    }
                    
                    
                }
                .navigationBarTitle("Search Recipes ☘️")
                /// disabling buttons in case user showing form
                .navigationBarItems(leading: horizontalButtonContainers(viewModel: viewModel, showResult: $viewModel.showResults)
                                    ,trailing: Button(action:{ viewModel.dismissView.wrappedValue.toggle() }) { DismissXmarkView(circleWidth: 30, circleHeight: 25) } )
                
                
                
            }
            /// if the result fetched and succeeded show result view
            if viewModel.showResults{
                /// to cover all the page
                Color(.systemBackground)
                    .edgesIgnoringSafeArea(.all)
                RecipeResultsView(dissmiss: $viewModel.showResults, recipes: $viewModel.recipes)
                    .animation(nil)
            }
        }
    }
}
struct SearchRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        SearchRecipeView(viewModel: SearchRecipeViewModel(dismissView: .constant(false)))
            .preferredColorScheme(.dark)
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
            }){ MagnifyButtonView()}
            Button(action:{
                /// show form
                self.viewModel.isShowForm = true
                
            })
            {  PlusButtonView() }
            
            
        }
        .disabled(viewModel.isShowForm)
    }
}
