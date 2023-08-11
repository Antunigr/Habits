//
//  SignInViewModel.swift
//  Habits
//
//  Created by antuni gt on 03/08/23.
//

import SwiftUI
import Combine

class SignInViewModel : ObservableObject{
    
    private var cancellable : AnyCancellable?
    private let publisher = PassthroughSubject<Bool, Never>()
  
    @Published var uiState: SignInUIState = .none
    
    init(){
        cancellable = publisher.sink {value in
            print("usuario criado com sucesso = \(value)")
        
            if value{
                self.uiState = .goToHomeScreen
            }
        }
    }
    
    deinit{
        cancellable?.cancel()
    }
    
    func login(email: String, password: String){
        self.uiState = .loading
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1){
            self.uiState = .goToHomeScreen
        }
    }
}

extension SignInViewModel{
    func homeView() -> some View{
        return SignInViewRouter.makeHomeView()
    }
}

extension SignInViewModel{
    func signUpView() -> some View{
        return SignInViewRouter.makeSignUpView(publisher: publisher)
    }
}
