//
//  SplashViewModel.swift
//  Habits
//
//  Created by antuni gt on 03/08/23.
//

import SwiftUI

class SplashViewModel: ObservableObject {
    @Published var uiState: SplashUIState = .loading

    func onAppear(){
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3){
            self.uiState = .goToSingInScreen
        }
    }

}

