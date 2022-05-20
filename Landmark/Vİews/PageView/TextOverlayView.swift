//
//  TextOverlayView.swift
//  Landmark
//
//  Created by Fatih Kilit on 19.05.2022.
//

import SwiftUI

struct TextOverlayView: View {
    var landmark: Landmark
    
    var gradient: LinearGradient {
        LinearGradient.linearGradient(
            colors: [.black.opacity(0.6), .black.opacity(0)],
            startPoint: .bottom,
            endPoint: .center)
    }
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            gradient
            
            VStack(alignment: .leading) {
                Text(landmark.name)
                    .font(.title)
                    .bold()
                
                Text(landmark.park)
            }
            .padding()
        }
        .foregroundColor(.white)
    }
}

struct TextOverlayView_Previews: PreviewProvider {
    static var previews: some View {
        TextOverlayView(landmark: ViewModel().landmarks.first!)
    }
}
