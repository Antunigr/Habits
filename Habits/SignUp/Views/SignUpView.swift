//
//  SignUpView.swift
//  Habits
//
//  Created by antuni gt on 11/08/23.
//

import SwiftUI

struct SignUpView: View {
    
    @ObservedObject var viewModel: SignUpViewModel
    
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
        EditTextView(text: $viewModel.fullName,
                     placeholder: "Nome Completo",
                     error: "seu nome deve ter mais de 3 caracteres",
                     failure: viewModel.fullName.count < 3,
                     isSecure: false)
    }
    
    var emailField: some View{
        EditTextView(text: $viewModel.email,
                     placeholder: "E-mail",
                     error: "E-mail invalido",
                     failure: !viewModel.email.isEmail(),
                     isSecure: false)
    }
    
    var passwordField: some View{
        EditTextView(text: $viewModel.password,
                     placeholder: "Senha",
                     error: "Senha fraca",
                     failure: viewModel.password.count < 6,
                     isSecure: true)
    }
    
    var phoneField: some View{
        EditTextView(text: $viewModel.phone,
                     placeholder: "Telefone",
                     error: "Numero Invalido",
                     failure: viewModel.phone.count < 9,
                     isSecure: false)
    }
    var birthdayField: some View{
        EditTextView(text: $viewModel.birthday,
                     placeholder: "Data de nascimento",
                     error: "Data invalida",
                     failure: viewModel.birthday.count < 8,
                     isSecure: false)
    }
    var enterButton: some View{
        LoadingButtonView(
            action: {
                viewModel.SignUp()
        },
            textBtn: "Realizar Cadastro",
            showProgress: self.viewModel.uiState == SignUpUIState.loading,
            disabled: !viewModel.email.isEmail() ||
            viewModel.password.count < 6 ||
            viewModel.fullName.count < 3 ||
            viewModel.phone.count < 9 ||
            viewModel.birthday.count < 8
        )
    }
}

extension SignUpView{
    var genderField : some View{
        Picker("Gender", selection: $viewModel.gender){
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
