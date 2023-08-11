//
//  SignUpView.swift
//  Habits
//
//  Created by antuni gt on 11/08/23.
//

import SwiftUI

struct SignUpView: View {

    @ObservedObject var viewModel: SignUpViewModel
    
    @State var fullName = ""
    @State var email = ""
    @State var password = ""
    @State var phone = ""
    @State var birthday = ""

    var body: some View {
        VStack(alignment: .leading, spacing:  8){
            Text("Cadastro")
                .foregroundColor(.black)
                .font(.system(.title).bold())
                .padding(.bottom, 8)
            
            fullNameField
            emailField
            passwordField
            phoneField
            birthdayField
            enterButton
        }
    }
}


extension SignUpView{
    var fullNameField: some View{
        SecureField("", text: $fullName)
            .border(Color.black)
    }
    
    var emailField: some View{
        SecureField("", text: $email)
            .border(Color.black)
    }
    
    var passwordField: some View{
        SecureField("", text: $password)
            .border(Color.black)
    }
    
    var phoneField: some View{
        SecureField("", text: $phone)
            .border(Color.black)
    }
    var birthdayField: some View{
        SecureField("", text: $birthday)
            .border(Color.black)
    }
    var enterButton: some View{
        Button("Realize o cadastro"){

        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView(viewModel: SignUpViewModel())
    }
}
