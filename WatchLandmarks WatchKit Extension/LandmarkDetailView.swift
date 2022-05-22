//
//  LandmarkDetailView.swift
//  WatchLandmarks WatchKit Extension
//
//  Created by Fatih Kilit on 22.05.2022.
//

import SwiftUI

struct LandmarkDetailView: View {
    @EnvironmentObject var viewModel: ViewModel
    var landmark: Landmark
    
    var landmarkIndex: Int {
        viewModel.landmarks.firstIndex(where: {$0.id == landmark.id}) ?? 0
    }
    
    var body: some View {
        ScrollView {
            VStack {
                CircleImageView(image: landmark.image.resizable())
                    .scaledToFit()
                
                Text(landmark.name)
                    .font(.headline)
                    .lineLimit(0)
                
                Toggle(isOn: $viewModel.landmarks[landmarkIndex].isFavorite) {
                    Text("Favorite")
                }
                
                Divider()
                
                Text(landmark.park)
                    .font(.caption)
                    .bold()
                    .lineLimit(0)
                
                Text(landmark.state)
                    .font(.caption)
                
                Divider()
                
                MapView(coordinate: landmark.locationCoordinate)
                    .scaledToFit()
                    .cornerRadius(5)
                    .disabled(true)
            }
            .padding()
        }
        .navigationTitle("Landmarks")
    }
}

struct LandmarkDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            LandmarkDetailView(landmark: ViewModel().landmarks.first!)
                .environmentObject(ViewModel())
        }
    }
}
