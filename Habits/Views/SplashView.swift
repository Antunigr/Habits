//
//  SplashView.swift
//  Habits
//
//  Created by antuni gt on 03/08/23.
//

import SwiftUI

struct SplashView: View {
    
    @ObservedObject var viewModel: SplashViewModel
    
    var body: some View {
        Group{
            switch viewModel.uiState{
            case.loading:
                LoadingView(sizeLogo: 120)
            case.goToSingInScreen:
                Text("SingInScreen")
            case.goToHomeScreen:
                Text("HomeScreen")
            case.error(let msg):
                LoadingView(sizeLogo: 120, error: msg)
            }
        }
        .onAppear(perform:{
            viewModel.onAppear
        } )
    }
}

//>>>

struct LoadingView: View {
    
    var sizeLogo: CGFloat
    var error: String? = nil
    
    var body: some View {
        ZStack{
            Image(systemName:"scribble.variable")
                .font(.custom("logo", size: sizeLogo))
            
            if let error = error{
                Text("")
                    .alert(isPresented: .constant(true)){
                        Alert(title: Text("Habit"), message: Text(error), dismissButton: .default(Text("Ok")){
                            
                    })
                }
            }
        }
    }
}




struct SplashView_Previews: PreviewProvider {
    
    
    static var previews: some View {
        let viewModel = SplashViewModel()
        SplashView(viewModel: viewModel)
    }
}
