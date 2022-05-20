//
//  HikeBadgeView.swift
//  Landmark
//
//  Created by Fatih Kilit on 19.05.2022.
//

import SwiftUI

struct HikeBadgeView: View {
    
    var name: String
    
    var body: some View {
        VStack(alignment: .center) {
            BadgeView()
                .frame(width: 300, height: 300)
                .scaleEffect(1 / 3)
                .frame(width: 100, height: 100)
            
            Text(name)
                .font(.caption)
        }
    }
}

struct HikeBadgeView_Previews: PreviewProvider {
    static var previews: some View {
        HikeBadgeView(name: "Preview Testing")
    }
}
