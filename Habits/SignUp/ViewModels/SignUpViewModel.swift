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
        
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_Us_POSIX")
        formatter.dateFormat = "dd/MM/yyyy"
        
        let dateFormatted = formatter.date(from: birthday)
        guard let dateFormatted = dateFormatted else {
            self.uiState = .error("Data invalida \(birthday)")
            return
        }
        
        formatter.dateFormat = "yyyy-MM-dd"
        let birthday = formatter.string(from: dateFormatted)

        
        WebService.postUser(request: SignUpRequest(
                            fullName: fullName,
                            email: email,
                            phone: phone,
                            password: password,
                            gender: gender.index,
                            birthday: birthday)
        )}
    }


extension SignUpViewModel{
    func homeView() -> some View{
        return SignUpViewRouter.makeHomeView()
    }
}
