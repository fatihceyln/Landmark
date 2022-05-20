//
//  ViewModel.swift
//  Landmark
//
//  Created by Fatih Kilit on 18.05.2022.
//

import Foundation

final class ViewModel: ObservableObject {
    @Published var landmarks: [Landmark] = load("landmarkData.json")
    var hikes: [Hike] = load("hikeData.json") // Because you’ll never modify hike data after initially loading it, you don’t need to mark it with the @Published attribute.
    
    @Published var profile = Profile.default
    
    var features: [Landmark] {
        landmarks.filter({ $0.isFeatured })
    }
    
    // Key is String, value is Landmark array
    var categories: [String : [Landmark]] {
        Dictionary(grouping: landmarks, by: {$0.category.rawValue})
        // category.rawValue -> 'Lakes, Mountains, Rivers' are key
        
        // Grouping lanmarks by category name
    }
}


func load<T: Decodable>(_ fileName: String) -> T {
    let data: Data
    
    // Getting file url
    guard let url = Bundle.main.url(forResource: fileName, withExtension: nil) else {
        fatalError("Couldn't find \(fileName) in main bundle.")
    }
    
    // Trying to get data from url
    do {
        data = try Data(contentsOf: url)
    } catch {
        fatalError("Couldn't load \(fileName) from main bundle:\n\(error)")
    }
    
    // Trying to decode data
    do {
        return try JSONDecoder().decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(fileName) as \(T.self):\n\(error)")
    }
}
