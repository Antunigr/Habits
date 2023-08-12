//
//  EditTextView.swift
//  Habits
//
//  Created by antuni gt on 12/08/23.
//

import SwiftUI

struct EditTextView: View {
    
    @Binding var text: String
    
    var placeholder: String = ""
    var keyboard: UIKeyboardType = .default
    var error: String? = nil
    var failure: Bool? = nil
    var isSecure: Bool = false
    
    var body: some View {
        VStack{
            if isSecure{
                SecureField(placeholder,text: $text)
                    .foregroundColor(.black)
                    .keyboardType(keyboard)
                    .textFieldStyle(CustomTextFieldStyle())
            }
            else{
                TextField(placeholder,text: $text)
                    .foregroundColor(.black)
                    .keyboardType(keyboard)
                    .textFieldStyle(CustomTextFieldStyle())
            }
            if let error = error, failure == true,
               !text.isEmpty{
                Text(error).foregroundColor(.red)
            }
        }
        .padding(.bottom, 10)
    }
}

struct EditTextView_Previews: PreviewProvider {
    static var previews: some View {
        VStack{
            EditTextView(text: .constant("txt"))
        }
       
    }
}
