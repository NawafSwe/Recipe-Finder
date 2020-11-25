//
//  AccountView.swift
//  Recipe Founder
//
//  Created by Nawaf B Al sharqi on 21/11/2020.
//
import SwiftUI
struct AccountView: View {
    @State private var email = ""
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var birthday = Date()
    @State private var password = ""
    @Binding var dismiss:Bool
    @StateObject private var viewModel = AccountViewModel()
    var body: some View {
        NavigationView{
            Form{
                Section(header:Text("Personal Info")){
                    TextField("First Name",text: $firstName)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                        .keyboardType(.default)
                        .textFieldStyle(PlainTextFieldStyle())
                    
                    
                    TextField("Last Name",text: $lastName)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                        .keyboardType(.default)
                        .textFieldStyle(PlainTextFieldStyle())
                    
                    TextField("Email",text: $email)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                        .keyboardType(.emailAddress)
                        .textFieldStyle(PlainTextFieldStyle())
                    
                }
                
                Section(header:Text("Sensitive info")){
                    SecureField("Change Password",text:$password)
                    
                    DatePicker("Birthday", selection: $birthday, displayedComponents: .date)
                        .accentColor(.black)
                }
                
                /// saving changes
                Button{
                    viewModel.saveAccount()
                }label:{
                    Text("Save Changes")
                }
                .accentColor(.healthyColor)
            }
            .navigationBarItems(leading: Button(action:{self.dismiss.toggle()}){DismissXmarkView(circleWidth: 30, circleHeight: 25)})
            .navigationTitle("Account Setting 😇")
        }
    }
}
struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView(dismiss: .constant(false))
    }
}
