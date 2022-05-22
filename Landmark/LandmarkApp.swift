//
//  LandmarkApp.swift
//  Landmark
//
//  Created by Fatih Kilit on 18.05.2022.
//

import SwiftUI

@main
struct LandmarkApp: App {
    @StateObject private var viewModel = ViewModel()
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(viewModel)
        }
        #if !os(watchOS)
        .commands {
            LandmarkCommands()
        }
        #endif
        
        #if os(watchOS)
            WKNotificationScene(controller: NotificationController.self, category: "LandmarkNear")
        #endif
        
        #if os(macOS)
        Settings {
            LandmarkSettings()
        }
        #endif
    }
}
