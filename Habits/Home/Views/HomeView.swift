//
//  HomeView.swift
//  Habits
//
//  Created by antuni gt on 10/08/23.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var viewModel: HomeViewModel
    
    

    
    var body: some View {
        Text("oi")
    }
}




struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: HomeViewModel())
    }
}
