//
//  ContentView.swift
//  Landmark
//
//  Created by Fatih Kilit on 18.05.2022.
//

import SwiftUI

struct MainView: View {
    
    @State private var selection: Tab = .featured
    
    enum Tab {
        case featured
        case list
    }
    
    var body: some View {
        TabView(selection: $selection) {
            CategoryHomeView()
                .tabItem({
                    Label("Featured", systemImage: "star")
                })
                .tag(Tab.featured)
            
            LandmarkListView()
                .tabItem({
                    Label("List", systemImage: "list.bullet")
                })
                .tag(Tab.list)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(ViewModel())
    }
}
