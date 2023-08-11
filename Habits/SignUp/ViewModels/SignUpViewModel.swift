//
//  SignUpViewModel.swift
//  Habits
//
//  Created by antuni gt on 11/08/23.
//

import SwiftUI
import Combine

class SignUpViewModel: ObservableObject{
    
    var publisher: PassthroughSubject<Bool, Never>!
    	
    func SignUp(){
        self.uiState = .loading
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5 ){
            self.uiState = .sucess
            self.publisher.send(true)
        }
    }
    
    @Published var uiState: SignUpUIState = .none
}

extension SignUpViewModel{
    func homeView() -> some View{
        return SignUpViewRouter.makeHomeView()
    }
}
