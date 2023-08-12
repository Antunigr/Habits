//
//  SignInUIState.swift
//  Habits
//
//  Created by antuni gt on 10/08/23.
//

import Foundation

enum SignInUIState : Equatable{
    case none
    case loading
    case goToHomeScreen
    case error(String)
}
