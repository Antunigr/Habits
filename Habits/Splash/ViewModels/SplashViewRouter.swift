//
//  SplashViewRouter.swift
//  Habits
//
//  Created by antuni gt on 03/08/23.
//

import SwiftUI

enum SplashViewRouter{
    static func makeSignView() -> some View{
        let viewModel = SignInViewModel()
        return SignInView(viewModel: viewModel)
    }
}
