//
//  BadgeSymbolView.swift
//  Landmark
//
//  Created by Fatih Kilit on 19.05.2022.
//

import SwiftUI

struct BadgeSymbolView: View {
    
    static let symbolColor = Color(red: 79.0 / 255, green: 79.0 / 255, blue: 191.0 / 255)
    
    var body: some View {
        GeometryReader { geometry in
            Path { path in
                let width = min(geometry.size.width, geometry.size.height)
                let height = width * 0.75
                let spacing = width * 0.030
                let middle = width * 0.5
                let topWidth = width * 0.226
                let topHeight = height * 0.488
                
                path.addLines([
                    CGPoint(x: middle, y: spacing),
                    CGPoint(x: middle - topWidth, y: topHeight - spacing),
                    CGPoint(x: middle, y: topHeight / 2 + spacing),
                    CGPoint(x: middle + topWidth, y: topHeight - spacing),
                    CGPoint(x: middle, y: spacing)
                ])
                
                path.move(to: CGPoint(x: middle, y: topHeight / 2 + spacing * 3))
                path.addLines([
                    CGPoint(x: middle - topWidth, y: topHeight + spacing),
                    CGPoint(x: spacing, y: height - spacing),
                    CGPoint(x: width - spacing, y: height - spacing),
                    CGPoint(x: middle + topWidth, y: topHeight + spacing),
                    CGPoint(x: middle, y: topHeight / 2 + spacing * 3)
                ])
                
                // Custom shape via hard-coded values
                /*
                path.move(to: CGPoint(x: 100, y: 0))
                path.addLine(to: CGPoint(x: 65, y: 80))
                path.addLine(to: CGPoint(x: 100, y: 60))
                path.addLine(to: CGPoint(x: 135, y: 80))
                
                path.move(to: CGPoint(x: 100, y: 80))
                path.addLine(to: CGPoint(x: 60, y: 100))
                path.addLine(to: CGPoint(x: 0, y: 200))
                path.addLine(to: CGPoint(x: 200, y: 200))
                path.addLine(to: CGPoint(x: 140, y: 100))
                */
                
            }
            .fill(Self.symbolColor)
        }
    }
}

struct BadgeSymbolView_Previews: PreviewProvider {
    static var previews: some View {
        BadgeSymbolView()
    }
}
