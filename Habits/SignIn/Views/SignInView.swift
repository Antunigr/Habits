//
//  SignInView.swift
//  Habits
//
//  Created by antuni gt on 03/08/23.
//

import SwiftUI

struct SignInView: View {
    @ObservedObject var viewModel : SignInViewModel
    
    @State var action: Int? = 0
    @State var navigationHidden = true
    
    var body: some View {
        ZStack{
            if case SignInUIState.goToHomeScreen = viewModel.uiState{
                viewModel.homeView()
            }
            else{
                NavigationView{
                    ScrollView(){
                        VStack{
                            LogoView(sizeLogo: 50)
                                .padding(.top,60)
                            Text("Login")
                                .font(.system(size: 30).bold())
                                .padding(.bottom,8)
                            emailField
                            passwordField
                            enterButton
                            registerLink
                        }
                        if case SignInUIState.error(let value) = viewModel.uiState{
                            Text("")
                                .alert(isPresented: .constant(true)){
                                    Alert(title: Text("Habit"), message: Text(value), dismissButton: .default(Text("Ok")){
                                })
                            }
                        }
                    }
                    .padding(.horizontal,32)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .navigationBarTitle("Login", displayMode: .inline)
                    .navigationBarHidden(navigationHidden)
                }
            }
        }
    }
}
extension SignInView{
    var emailField: some View{
        
        EditTextView(text: $viewModel.email,
                     placeholder: "E-mail",
                     keyboard: .emailAddress,
                     error: "E-mail invalid",
                     failure: !viewModel.email.isEmail())
        
    }
    var passwordField: some View{
        EditTextView(text: $viewModel.password,
                     placeholder: "Senha",
                     keyboard: .emailAddress,
                     error: "senha fraca",
                     failure: viewModel.password.count < 6,
                     isSecure: true)
    }
    var enterButton: some View{
        LoadingButtonView(
          action: {
              viewModel.login()
        },
          textBtn: "Entrar",
          showProgress: self.viewModel.uiState == SignInUIState.loading,
          disabled: !viewModel.email.isEmail() || viewModel.password.count < 6)
    }
    
    var registerLink: some View{
        VStack{
            Text("Ainda näo possui um login ativo?")
                .foregroundColor(.gray)
                .padding(.top, 48)
            VStack{
                NavigationLink(destination: viewModel.signUpView(),
                               tag: 1,
                               selection: $action,
                               label: {EmptyView()})
                Button("Realize seu cadastro"){
                    self.action = 1
                }
            }
        }
    }
}


struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = SignInViewModel()
        SignInView(viewModel: viewModel)
    }
}


