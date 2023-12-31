//
//  CustomTextFieldStyle.swift
//  Habits
//
//  Created by antuni gt on 12/08/23.
//

import SwiftUI

struct CustomTextFieldStyle: TextFieldStyle{
    public func _body(configuration: TextField<Self._Label>) -> some View{
        configuration
            .padding(.horizontal, 8)
            .padding(.vertical, 16)
            .overlay(
                RoundedRectangle(cornerRadius: 8.0)
                    .stroke(Color.blue, lineWidth: 0.8)
            )
    }
}
