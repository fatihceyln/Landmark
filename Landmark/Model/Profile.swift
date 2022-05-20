//
//  Profile.swift
//  Landmark
//
//  Created by Fatih Kilit on 19.05.2022.
//

import Foundation

struct Profile {
    var username: String
    var prefersNotifications = true
    var seasonalPhoto = Season.winter
    var goalDate = Date()
    
    // default is Swift reserved keyword, that's why backticks are needed
    static let `default` = Profile(username: "Fatih")
    
    enum Season: String, CaseIterable, Identifiable {
        case spring = "🌷"
        case summer = "🌞"
        case autumn = "🍂"
        case winter = "☃️"
        
        var id: String { rawValue }
    }
}
