//
//  CategoryHome.swift
//  Landmark
//
//  Created by Fatih Kilit on 19.05.2022.
//

import SwiftUI

struct CategoryHomeView: View {
    
    @EnvironmentObject private var viewModel: ViewModel
    @State private var showingProfile: Bool = false
    
    var body: some View {
        NavigationView {
            List {
                
                PageView(pages: viewModel.features.map( {FeatureCardView(landmark: $0) }))
                    .aspectRatio(3 / 2, contentMode: .fit)
                    .listRowInsets(EdgeInsets())
                
                ForEach(viewModel.categories.keys.sorted(), id: \.self) { key in
                    CategoryRowView(categoryName: key, landmarks: viewModel.categories[key] ?? [])
                }
                .listRowInsets(EdgeInsets())
            }
            .listStyle(.inset)
            .navigationTitle("Featured")
            .toolbar {
                Button {
                    showingProfile.toggle()
                } label: {
                    Image(systemName: "person.crop.circle")
                }

            }
            .sheet(isPresented: $showingProfile) {
                ProfileHostView()
                    .environmentObject(viewModel)
                
                // Since 'ProfileHostView' is a new view, we need to send the environmentObject
                
                // Even though this view (ProfileHostView) doesn’t use a property with the @EnvironmentObject attribute, ProfileSummary, a child of this view, does. So without the modifier, the preview fails.
            }
        }
    }
}

struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHomeView()
            .environmentObject(ViewModel())
    }
}
