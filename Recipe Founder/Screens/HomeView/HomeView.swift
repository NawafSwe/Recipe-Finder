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
                }.padding(.vertical,70)
                .navigationBarTitle("Home ☘️")
                
            }
        .sheet(isPresented: $showSearchView){
            SearchRecipeView(dismissView: $showSearchView)
        }
        }
    }
}
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
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
        .padding(.bottom,20)
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
                .frame(width: 320, height: 300, alignment: .center)
                .cornerRadius(40)
        }
        .overlay(TitleTextView(),alignment: .center)
        .shadow(radius: 10)
        
        
    }
}
