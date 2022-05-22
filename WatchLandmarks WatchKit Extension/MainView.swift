//
//  ContentView.swift
//  WatchLandmarks WatchKit Extension
//
//  Created by Fatih Kilit on 22.05.2022.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        LandmarkListView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MainView()
                .environmentObject(ViewModel())
        }
    }
}
