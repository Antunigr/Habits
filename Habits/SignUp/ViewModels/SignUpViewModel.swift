//
//  SignUpViewModel.swift
//  Habits
//
//  Created by antuni gt on 11/08/23.
//

import SwiftUI
import Combine

class SignUpViewModel: ObservableObject{
    
    @Published var fullName = ""
    @Published var email = ""
    @Published var password = ""
    @Published var phone = ""
    @Published var birthday = ""
    @Published var gender: Gender = Gender.famale
    
    var publisher: PassthroughSubject<Bool, Never>!
    @Published var uiState: SignUpUIState = .none
    
    func SignUp(){
        self.uiState = .loading
        
        WebService.postUser(fullname: fullName,
                            email: email,
                            password: password,
                            phone: phone,
                            birthday: birthday,
                            gender: gender.index)
        }
    }


extension SignUpViewModel{
    func homeView() -> some View{
        return SignUpViewRouter.makeHomeView()
    }
}
