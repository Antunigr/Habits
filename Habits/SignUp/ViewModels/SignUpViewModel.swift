//
//  SignUpViewModel.swift
//  Habits
//
//  Created by antuni gt on 11/08/23.
//

import SwiftUI

class SignUpViewModel: ObservableObject{
    
    func SignUp(){
        self.uiState = .loading
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5 ){
//          self.uiState = .error("erro no cadastro")
            self.uiState = .goToHomePage
        }
    }
    
    @Published var uiState: SignUpUIState = .none
}

extension SignUpViewModel{
    func homeView() -> some View{
        return SignUpViewRouter.makeHomeView()
    }
}
