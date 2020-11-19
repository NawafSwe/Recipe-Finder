//
//  HomeView.swift
//  Recipe Founder
//
//  Created by Nawaf B Al sharqi on 19/11/2020.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView{
            VStack{
                CardView()
                Spacer()
            }.padding(.vertical,70)
            .navigationBarTitle("Home ☘️")
            
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
