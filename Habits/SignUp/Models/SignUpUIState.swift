//
//  SignUpUIState.swift
//  Habits
//
//  Created by antuni gt on 11/08/23.
//

import Foundation

enum SignUpUIState: Equatable{
    case none
    case loading
    case sucess
    case error(String)
}
