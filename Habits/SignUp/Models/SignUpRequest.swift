//
//  SignUpRequest.swift
//  Habits
//
//  Created by antuni gt on 12/08/23.
//

import Foundation

struct SignUpRequest: Encodable {

    let fullName: String
    let email: String
    let phone: String
    let password: String
    let gender: Int
    let birthday: String
    
    enum CodingKeys: String, CodingKey {
        case fullName = "name"
        case email
        case password
        case phone
        case birthday
        case gender
    }
}
