//
//  SplashView.swift
//  Habits
//
//  Created by antuni gt on 03/08/23.
//

import SwiftUI

struct SplashView: View {
    
    @State var state: SplashUIState = .loading
    
    
    var body: some View {
        switch state{
        case.loading:
            LoadingView()
        case.goToSingInScreen:
            Text("SingInScreen")
        case.goToHomeScreen:
            Text("HomeScreen")
        case.error(let msg):
            Text("error>>\n \(msg)")
        }
    }
}

//>>>

struct LoadingView: View {
    var body: some View {
        ZStack{
            Image(systemName:"scribble.variable")
                .font(.custom("logo", size: 120))        }
    }
}




struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
