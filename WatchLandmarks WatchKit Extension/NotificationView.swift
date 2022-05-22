//
//  NotificationView.swift
//  WatchLandmarks WatchKit Extension
//
//  Created by Fatih Kilit on 22.05.2022.
//

import SwiftUI

struct NotificationView: View {
    
    var title: String?
    var message: String?
    var landmark: Landmark?
    
    var body: some View {
        VStack {
            if landmark != nil {
                CircleImageView(image: landmark?.image.resizable() ?? Image(systemName: "questionmark"))
                    .scaledToFit()
            }
            
            Text(title ?? "Unkown Landmark")
                .font(.headline)
            
            Divider()
            
            Text(message ?? "You are within 5 miles of one of your favorite landmarks.")
        }
        .lineLimit(0)
    }
}

struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NotificationView()
            
            NotificationView(title: "Turtle Rock", message: "You are within 5 miles of Turtle Rock", landmark: ViewModel().landmarks[0])
        }
    }
}
