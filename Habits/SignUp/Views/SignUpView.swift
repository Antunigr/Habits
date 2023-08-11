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
    @State var gender: Gender = Gender.famale
    
    var body: some View {
        ScrollView(){
            VStack{
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
                    genderField
                    enterButton
                }
                Spacer()
            }
            .padding(.horizontal, 8)
        }
        .padding(.horizontal, 20)
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
            viewModel.SignUp()
        }
    }
    
}

extension SignUpView{
    var genderField : some View{
        Picker("Gender", selection: $gender){
            ForEach(Gender.allCases, id: \.self) { value in
                Text(value.rawValue)
                    .tag(value)
            }
        }
        .pickerStyle(SegmentedPickerStyle())
        .padding(.top, 16)
        .padding(.bottom, 32)
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView(viewModel: SignUpViewModel())
    }
}
