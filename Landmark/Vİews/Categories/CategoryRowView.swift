//
//  CategoryRowView.swift
//  Landmark
//
//  Created by Fatih Kilit on 19.05.2022.
//

import SwiftUI

struct CategoryRowView: View {
    
    var categoryName: String
    var landmarks: [Landmark]
    
    var body: some View {
        VStack {
            Text(categoryName)
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 5) {
                    ForEach(landmarks) { landmark in
                        NavigationLink {
                            LandmarkDetailView(landmark: landmark)
                        } label: {
                            CategoryItemView(landmark: landmark)
                        }

                    }
                }
            }
            .frame(height: 185)
        }
    }
}

struct CategoryRowView_Previews: PreviewProvider {
    
    static var landmarks = ViewModel().landmarks
    
    static var previews: some View {
        CategoryRowView(categoryName: landmarks[0].category.rawValue, landmarks: Array(landmarks.prefix(5)))
    }
}
