//
//  SignUpViewRouter.swift
//  Habits
//
//  Created by antuni gt on 11/08/23.
//

import SwiftUI
import Combine

enum SignUpViewRouter{
    static func makeHomeView() -> some View {
        let viewModel = HomeViewModel()
        return HomeView(viewModel: viewModel)
    }
}
