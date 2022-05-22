//
//  LandmarkCommands.swift
//  Landmark
//
//  Created by Fatih Kilit on 22.05.2022.
//

import SwiftUI

struct LandmarkCommands: Commands {
    
    @FocusedBinding(\.selectedLandmark) var selectedLandmark
    
    var body: some Commands {
        SidebarCommands() // This built-in command set includes the command for toggling the sidebar.
        
        CommandMenu("Landmark") {
            Button {
                selectedLandmark?.isFavorite.toggle()
            } label: {
                Text("\(selectedLandmark?.isFavorite == true ? "Remove" : "Mark") as Favorite")
            }
            .keyboardShortcut("f", modifiers: [.shift, .option])
            .disabled(selectedLandmark == nil)
        }
    }
}

private struct SelectLandmarkKey: FocusedValueKey {
    typealias Value = Binding<Landmark>
}

extension FocusedValues {
    var selectedLandmark: Binding<Landmark>? {
        get {
            self[SelectLandmarkKey.self]
        }
        set {
            self[SelectLandmarkKey.self] = newValue
        }
    }
}
