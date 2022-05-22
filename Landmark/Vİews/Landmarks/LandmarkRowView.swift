//
//  LandmarkRowView.swift
//  Landmark
//
//  Created by Fatih Kilit on 18.05.2022.
//

import SwiftUI

struct LandmarkRowView: View {
    
    var landmark: Landmark
    
    var body: some View {
        HStack {
            landmark.image
                .resizable()
                .frame(width: 50, height: 50)
                .cornerRadius(5)
            
            VStack(alignment: .leading) {
                Text(landmark.name)
                    .bold()
                #if !os(watchOS)
                Text(landmark.park)
                    .font(.caption)
                    .foregroundColor(.secondary)
                #endif
            }
            
            Spacer()
            
            if landmark.isFavorite {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            }
        }
        .padding(.vertical, 4)
    }
}

struct LandmarkRowView_Previews: PreviewProvider {
    
    static var landmarks = ViewModel().landmarks
    
    static var previews: some View {
        Group {
            LandmarkRowView(landmark: landmarks[0])
                
            LandmarkRowView(landmark: landmarks[1])
        }
        .previewLayout(.sizeThatFits)
    }
}
