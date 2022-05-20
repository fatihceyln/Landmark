//
//  ProfileSummaryView.swift
//  Landmark
//
//  Created by Fatih Kilit on 19.05.2022.
//

import SwiftUI

struct ProfileSummaryView: View {
    
    @EnvironmentObject private var viewModel: ViewModel
    var profile: Profile
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                Text(profile.username)
                    .bold()
                    .font(.title)
                
                Text("Notifications: \(profile.prefersNotifications ? "on" : "off")")
                Text("Seasonal Photos: \(profile.seasonalPhoto.rawValue)")
                Text("Goal Date: \(Text(profile.goalDate, style: .date))")
                
                Divider()
                
                VStack(alignment: .leading) {
                    Text("Completed Badges")
                        .font(.headline)
                    
                    ScrollView(.horizontal) {
                        HStack {
                            HikeBadgeView(name: "First Hike")
                            
                            HikeBadgeView(name: "Earth Day")
                                .hueRotation(Angle(degrees: 90))
                            
                            HikeBadgeView(name: "Tenth Hike")
                                .grayscale(0.5)
                                .hueRotation(Angle(degrees: 45))
                        }
                    }
                }
                
                Divider()
                
                VStack(alignment: .leading) {
                    Text("Recent Hikes")
                        .font(.headline)
                    
                    HikeView(hike: viewModel.hikes[0])
                }
            }
        }
    }
}



struct ProfileSummaryView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSummaryView(profile: Profile.default)
            .environmentObject(ViewModel())
    }
}
