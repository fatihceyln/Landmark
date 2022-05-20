//
//  FeatureCardView.swift
//  Landmark
//
//  Created by Fatih Kilit on 19.05.2022.
//

import SwiftUI

struct FeatureCardView: View {
    
    var landmark: Landmark
    
    var body: some View {
        landmark.featureImage?
            .resizable()
            .frame(maxWidth: .infinity)
            //.aspectRatio(3/2, contentMode: .fit)
            .aspectRatio(contentMode: .fit)
            .overlay {
                TextOverlayView(landmark: landmark)
            }
    }
}

struct FeatureCardView_Previews: PreviewProvider {
    static var previews: some View {
        FeatureCardView(landmark: ViewModel().features[0])
    }
}
