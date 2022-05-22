//
//  LandmarkDetailView.swift
//  MacLandmarks
//
//  Created by Fatih Kilit on 22.05.2022.
//

import SwiftUI
import MapKit

struct LandmarkDetailView: View {
    @EnvironmentObject private var viewModel: ViewModel
    var landmark: Landmark
    
    var landmarkIndex: Int {
        viewModel.landmarks.firstIndex(where: {$0.id == landmark.id}) ?? 0
    }
    
    var body: some View {
        ScrollView {
            ZStack(alignment: .topTrailing) {
                MapView(coordinate: landmark.locationCoordinate)
                    .frame(height: 300)
                    .ignoresSafeArea(edges: .top)
                
                Button("Open in Maps") {
                    let destination = MKMapItem(placemark: MKPlacemark(coordinate: landmark.locationCoordinate))
                    
                    destination.name = landmark.name
                    destination.openInMaps()
                }
                .padding()
            }
            
            VStack(alignment: .leading, spacing: 20) {
                HStack(spacing: 24) {
                    CircleImageView(image: landmark.image.resizable())
                        .frame(width: 160, height: 160)
                    
                    VStack(alignment: .leading) {
                        HStack {
                            Text(landmark.name)
                                .font(.title)
                            
                            FavoriteButtonView(isSet: $viewModel.landmarks[landmarkIndex].isFavorite)
                                .buttonStyle(.plain)
                        }
                        
                        VStack(alignment: .leading) {
                            Text(landmark.park)
                            Text(landmark.state)
                        }
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    }
                }
                
                Divider()
                
                Text("About \(landmark.name)")
                    .font(.title2)
                
                Text(landmark.description)
            }
            .padding()
            .frame(maxWidth: 700) // This improves readability when the user makes the window very wide.
            .offset(y: -50)
        }
        .navigationTitle(landmark.name)
    }
}

struct LandmarkDetailView_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkDetailView(landmark: ViewModel().landmarks[0])
            .environmentObject(ViewModel())
            .frame(width: 800, height: 750)
    }
}
