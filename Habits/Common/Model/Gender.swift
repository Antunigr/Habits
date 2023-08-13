//
//  Gender.swift
//  Habits
//
//  Created by antuni gt on 11/08/23.
//

import Foundation

enum Gender: String, CaseIterable, Identifiable {
    case male = "Masculino"
    case famale = "Feminino"
    case other = "Outro"
    
    var id: String{
        self.rawValue
    }
    
    var index: Self.AllCases.Index{
        return Self.allCases.firstIndex { self == $0 } ?? 0
    }
}
