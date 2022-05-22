//
//  LandmarkSettings.swift
//  Landmark
//
//  Created by Fatih Kilit on 22.05.2022.
//

import SwiftUI

struct LandmarkSettings: View {
    
    @AppStorage("MapView.zoom") private var zoom: MapView.Zoom = .medium
    
    var body: some View {
        Form {
            Picker("Map Zoom", selection: $zoom) {
                ForEach(MapView.Zoom.allCases) { level in
                    Text(level.rawValue)
                }
            }
            .pickerStyle(.inline)
        }
        .frame(width: 300)
        .navigationTitle("Landmark Settings")
        .padding(80)
    }
}

struct LandmarkSettings_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkSettings()
    }
}
