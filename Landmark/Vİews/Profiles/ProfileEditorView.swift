//
//  ProfileEditorView.swift
//  Landmark
//
//  Created by Fatih Kilit on 19.05.2022.
//

import SwiftUI

struct ProfileEditorView: View {
    
    @Binding var profile: Profile
    
    var dateRange: ClosedRange<Date> {
        let min = Calendar.current.date(byAdding: .year, value: -1, to: profile.goalDate) ?? Date()
        let max = Calendar.current.date(byAdding: .year, value: 1, to: profile.goalDate) ?? Date()
        
        return min...max
    }
    
    var body: some View {
        List {
            HStack {
                Text("Username")
                    .bold()
                
                Divider()
                
                TextField("username", text: $profile.username)
            }
            
            Toggle(isOn: $profile.prefersNotifications) {
                Text("Enable Notifications")
                    .bold()
            }
            
            VStack(alignment: .leading, spacing: 20) {
                Text("Seosonal Photo")
                    .bold()
                
                Picker("Seosonal Photo", selection: $profile.seasonalPhoto) {
                    ForEach(Profile.Season.allCases) { season in
                        Text(season.rawValue)
                            .tag(season)
                    }
                }
                .pickerStyle(.segmented)
            }
            
            DatePicker(selection: $profile.goalDate, in: dateRange, displayedComponents: .date) {
                Text("Goal Date")
                    .bold()
            }
            .datePickerStyle(.compact)
        }
    }
}

struct ProfileEditorView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileEditorView(profile: .constant(.default))
    }
}
