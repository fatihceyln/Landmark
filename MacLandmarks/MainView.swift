//
//  ContentView.swift
//  MacLandmarks
//
//  Created by Fatih Kilit on 22.05.2022.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        LandmarkListView()
            .frame(minWidth: 700, minHeight: 300)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(ViewModel())
    }
}
