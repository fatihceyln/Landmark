//
//  LandmarkListView.swift
//  Landmark
//
//  Created by Fatih Kilit on 18.05.2022.
//

import SwiftUI

struct LandmarkListView: View {
    
    @EnvironmentObject private var viewModel: ViewModel
    @State private var showFavoritesOnly = false
    @State private var filter = FilterCategory.all
    @State private var selectedLandmark: Landmark?
    
    var filteredLandmarks: [Landmark] {
        viewModel.landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
            &&
            (filter == .all || filter.rawValue == landmark.category.rawValue)
        }
    }
    
    enum FilterCategory: String, CaseIterable, Identifiable {
        case all = "All"
        case lakes = "Lakes"
        case rivers = "Rivers"
        case mountains = "Mountains"
        
        var id: FilterCategory {
            self
        }
    }
    
    var title: String {
        let title = filter == .all ? "Landmarks" : filter.rawValue
        return showFavoritesOnly ? "Favorite \(title)" : title
    }
    
    var index: Int? {
        viewModel.landmarks.firstIndex(where: {$0.id == selectedLandmark?.id})
    }
    
    
    var body: some View {
        NavigationView {
            List(selection: $selectedLandmark) {
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink {
                        LandmarkDetailView(landmark: landmark)
                    } label: {
                        LandmarkRowView(landmark: landmark)
                    }
                    .tag(landmark)
                }
            }
            .navigationTitle(title)
            .frame(minWidth: 300) // the list never becomes too small as the user resizes the macOS window.
            .toolbar {
                ToolbarItem {
                    Menu {
                        Picker("Category", selection: $filter) {
                            ForEach(FilterCategory.allCases) { category in
                                Text(category.rawValue)
                                    .tag(category)
                            }
                        }
                        .pickerStyle(.inline)
                        
                        Toggle(isOn: $showFavoritesOnly) {
                            Text("Favorites only")
                        }
                    } label: {
                        Label("Filter", systemImage: "slider.horizontal.3")
                    }

                }
            }
            
            // Adding the second child view automatically converts the list to use the sidebar list style.
            #if os(macOS)
            Text("Select a Landmark")
            #endif
        }
        .focusedValue(\.selectedLandmark, $viewModel.landmarks[index ?? 0])
    }
}

struct LandmarkListView_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkListView()
            .environmentObject(ViewModel())
    }
}
