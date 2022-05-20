//
//  RotatedBadgeSymbolView.swift
//  Landmark
//
//  Created by Fatih Kilit on 19.05.2022.
//

import SwiftUI

struct RotatedBadgeSymbolView: View {
    let angle: Angle
    
    var body: some View {
        BadgeSymbolView()
            .padding(-60)
            .rotationEffect(angle, anchor: .bottom)
    }
}

struct RotatedBadgeSymbol_Previews: PreviewProvider {
    static var previews: some View {
        RotatedBadgeSymbolView(angle: Angle(degrees: 5))
    }
}
