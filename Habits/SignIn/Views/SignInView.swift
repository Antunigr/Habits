//
//  SignInView.swift
//  Habits
//
//  Created by antuni gt on 03/08/23.
//

import SwiftUI

struct SignInView: View {
    @ObservedObject var viewModel : SignInViewModel
    
    @State var email = ""
    @State var password = ""
    @State var action: Int? = 0
    @State var navigationHidden = true
    
    var body: some View {
        NavigationView{
            ScrollView(){
                VStack{
                    LogoView(sizeLogo: 50)
                        .padding(.top,60)
                    Text("Login")
                        .font(.system(size: 30).bold())
                        .padding(.bottom,8)
                    Text(email)
                        .font(.system(size: 20).bold())
                        .padding(.bottom,8)
                    emailField
                    passwordField
                    enterButton
                    registerLink
                }
            }
            .padding(.horizontal,32)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .navigationBarTitle("Login", displayMode: .inline)
            .navigationBarHidden(navigationHidden)
        }
    }
}
extension SignInView{
    var emailField: some View{
        SecureField("", text: $email)
            .border(Color.black)
    }
    
    var passwordField: some View{
        SecureField("", text: $email)
            .border(Color.black)
    }
    
    var enterButton: some View{
        Button("Entrar"){
            
        }
    }
    
    var registerLink: some View{
        VStack{
            Text("Ainda näo possui um login ativo?")
                .foregroundColor(.gray)
                .padding(.top, 48)
            VStack{
                NavigationLink(destination: Text("Fazer login"),
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


