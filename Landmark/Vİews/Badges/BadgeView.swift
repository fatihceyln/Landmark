//
//  BadgeView.swift
//  Landmark
//
//  Created by Fatih Kilit on 19.05.2022.
//

import SwiftUI

struct BadgeView: View {
    
    var badgeSymbols: some View {
        ForEach(0..<8) { index in
            RotatedBadgeSymbolView(angle: Angle(degrees: Double(index) * 45.0))
                .opacity(0.5)
        }
    }
    
    var body: some View {
        ZStack {
            BadgeBackgroundView()
            
            GeometryReader { geo in
                badgeSymbols
                    .scaleEffect(1 / 4, anchor: .top)
                    .position(x: geo.size.width / 2, y: geo.size.height * (3 / 4))
            }
        }
        
    }
}

struct BadgeView_Previews: PreviewProvider {
    static var previews: some View {
        BadgeView()
    }
}
