//
//  LoadingButtonView.swift
//  Habits
//
//  Created by antuni gt on 12/08/23.
//

import SwiftUI

struct LoadingButtonView: View {
    
    var action: () -> Void
    var textBtn: String
    var showProgress: Bool = false
    var disabled: Bool = false
    
    var body: some View{
        ZStack{
            Button(action: {action()}, label: {
                Text(showProgress ? " " : textBtn)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical,14)
                    .padding(.horizontal,16)
                    .font(.system(.title2).bold())
                    .background(disabled ? Color.gray : Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(4.0)
            }).disabled(disabled || showProgress)
            
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle())
                .opacity(showProgress ? 1 : 0)
        }
    }
}

struct LoadingButtonView_Previews: PreviewProvider {
    static var previews: some View {
        VStack{
            LoadingButtonView(action: {
               
            },
            textBtn: "entrar")
        }
    }
}
