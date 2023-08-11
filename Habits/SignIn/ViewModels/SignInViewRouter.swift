//
//  SignInViewRouter.swift
//  Habits
//
//  Created by antuni gt on 10/08/23.
//

import SwiftUI
import Combine

enum SignInViewRouter{
    static func makeHomeView() -> some View {
        let viewModel = HomeViewModel()
        return HomeView(viewModel: viewModel)
    }
    
    static func makeSignUpView(publisher: PassthroughSubject<Bool, Never>) -> some View{
        let viewModel = SignUpViewModel()
        return SignUpView(viewModel: viewModel)
    }
}
