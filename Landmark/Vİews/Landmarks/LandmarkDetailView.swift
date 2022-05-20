//
//  LandmarkDetailView.swift
//  Landmark
//
//  Created by Fatih Kilit on 18.05.2022.
//

import SwiftUI

struct LandmarkDetailView: View {
    
    @EnvironmentObject private var viewModel: ViewModel
    var landmark: Landmark
    
    var landmarkIndex: Int {
        viewModel.landmarks.firstIndex(where: {$0.id == landmark.id}) ?? 0
    }
    
    var body: some View {
        ScrollView {
            MapView(coordinate: landmark.locationCoordinate)
                .frame(height: 300)
                .ignoresSafeArea(edges: .top)
            
            CircleImageView(image: landmark.image)
                .offset(y: -130)
                .padding(.bottom, -130)
            
            VStack(alignment: .leading) {
                HStack {
                    Text(landmark.name)
                        .font(.title)
                    
                    FavoriteButtonView(isSet: $viewModel.landmarks[landmarkIndex].isFavorite)
                }
                
                HStack {
                    Text(landmark.park)
                        .font(.subheadline)
                    
                    Spacer()
                    
                    Text(landmark.state)
                        .font(.subheadline)
                }
                .font(.subheadline)
                .foregroundColor(.secondary)
                
                Divider()
                
                Text("About \(landmark.name)")
                    .font(.title2)
                
                Text(landmark.description)
            }
            .padding()
        }
        .navigationTitle(landmark.name)
        .navigationBarTitleDisplayMode(.inline)
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
