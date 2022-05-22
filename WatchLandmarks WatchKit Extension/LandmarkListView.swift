//
//  LandmarkListView.swift
//  WatchLandmarks WatchKit Extension
//
//  Created by Fatih Kilit on 22.05.2022.
//

import SwiftUI

struct LandmarkListView: View {
    
    @EnvironmentObject private var viewModel: ViewModel
    @State private var showFavoritesOnly = false
    
    var filteredLandmarks: [Landmark] {
        viewModel.landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }
    
    
    var body: some View {
        NavigationView {
            List {
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites only")
                }
                
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink {
                        LandmarkDetailView(landmark: landmark)
                    } label: {
                        LandmarkRowView(landmark: landmark)
                    }
                }
            }
            .navigationTitle("Landmarks")
        }
    }
}

struct LandmarkListView_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkListView()
            .environmentObject(ViewModel())
    }
}
