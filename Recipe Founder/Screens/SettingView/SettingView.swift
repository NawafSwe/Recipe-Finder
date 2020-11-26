//
//  SettingView.swift
//  Recipe Founder
//
//  Created by Nawaf B Al sharqi on 19/11/2020.
//

import SwiftUI

struct SettingView: View {
    @State private var showSafari = false
    @State private var showAccountSetting = false
    var body: some View {
        NavigationView {
            Form {
                Section(header:Text("General Settings")){
                    
                    Button{
                        showAccountSetting.toggle()
                        
                    }label:{ SettingCellView(image: Icons.SFPerson, title: "Account",color: .text_color) }
                    .sheet(isPresented: $showAccountSetting){
                        AccountView(dismiss: $showAccountSetting)
                    }
                    
                    Button{ showSafari.toggle()
                    }label:{ SettingCellView(image: Icons.SFMessage, title: "Contact Developer",color: .text_color)
                    }
                    .sheet(isPresented: $showSafari){
                        SafariView(url:URL(string:"https://twitter.com/Nawaf_B_910")!)
                    }
                }
                .accentColor(.black)
                Section{
                    Button{ }label:{
                        SettingCellView(image: Icons.SFWifi, title: "Logout", color: .red)
                    }
                    .accentColor(.red)
                }
                
            }
            .navigationBarTitle("Setting ✈️")
        }
    }
}
struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
            .colorScheme(.dark)
    }
}
//MARK:- SettingCellView
struct SettingCellView :View{
    let image:Image
    let title:String
    let color:Color
    var body: some View{
        HStack(spacing:10){
            image
                .resizable()
                .frame(width:28, height: 28)
                .foregroundColor(color)
            
            Text(title)
                .font(.title3)
                .font(.system(size:16))
                .foregroundColor(color)
        }
    }
}
