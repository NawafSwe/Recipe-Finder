//
//  HomeView.swift
//  Recipe Founder
//
//  Created by Nawaf B Al sharqi on 19/11/2020.
//

import SwiftUI
//MARK:- Home View
struct HomeView: View {
    @State var showSearchView = false
    var body: some View {
        ZStack {
            NavigationView{
                VStack{
                    CardView()
                        .onTapGesture {
                            self.showSearchView.toggle()
                        }
                    Spacer()
                }
                .padding(.vertical,50)
                .navigationBarTitle("Home ☘️")
                
            }
            
            if showSearchView {
                /// injecting the search recipe view model with the binding to dismiss view
                SearchRecipeView(viewModel: SearchRecipeViewModel(dismissView: $showSearchView))
                    /// animation is inherited to all views which may make the app heavy
                    .transition(.move(edge: .bottom))
                    .animation(.easeIn)
                    /// to prevent propagation to all views
                    .animation(nil)
            }
            
        }
    }
}
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .preferredColorScheme(.dark)
            
    }
}

//MARK:- Title Text View
struct TitleTextView : View {
    var body: some View{
        VStack{
            Spacer()
            Text("Search Recipes By Ingredients")
                .font(.system(size:16))
                .bold()
                .fontWeight(.semibold)
                .foregroundColor(.black)
                .multilineTextAlignment(.center)
            
        }
        .padding(.bottom,10)
        .padding(.leading)
    }
}

//MARK:- Card View
struct CardView: View {
    var body: some View {
        VStack{
            Image("galshir-paper-boat")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 340, height: 290, alignment: .center)
                .cornerRadius(40)
        }
        .overlay(TitleTextView(),alignment: .center)
        .shadow(radius: 10)
        
        
    }
}
