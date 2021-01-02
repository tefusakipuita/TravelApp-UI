//
//  PlaceCardView.swift
//  Travel App
//
//  Created by 中筋淳朗 on 2020/12/09.
//

import SwiftUI

struct PlaceCardView: View {
    
    // MARK: - Property
    
    var place: Place
    
    
    // MARK: - Body
    
    var body: some View {
        VStack (spacing: 0) {
            ZStack (alignment: .bottomLeading) {
                
                // MARK: - Image
                Image(place.imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: CGFloat.cardWidth, height: 300)
                    .clipped()
                
                // MARK: - Mask
                LinearGradient(gradient: Gradient(stops: [
                    .init(color: Color.black.opacity(0.001), location: 0.4),
                    .init(color: Color.black.opacity(0.8), location: 1)
                ]),
                startPoint: .top,
                endPoint: .bottom)
                .frame(height: 300)
                
                // MARK: - Info
                VStack (alignment: .leading, spacing: 14) {
                    Text(place.name)
                        .font(.system(size: 38, weight: .bold))
                    
                    Text(place.date)
                } //: VStack
                .foregroundColor(.white)
                .padding(10)
            } //: ZStack
            
            // MARK: - Bottom Info
            ZStack (alignment: .leading) {
                Color.white
                    .frame(width: CGFloat.cardWidth, height: 70)
                
                HStack {
                    Image(systemName: "airplane")
                        .rotationEffect(Angle(degrees: -30))
                    
                    Text(place.departureDayLeft)
                } //: HStack
                .foregroundColor(Color.black.opacity(0.8))
                .padding(.leading)
            } //: ZStack
            
        } //: VStack
        .cornerRadius(20)
        .shadow(color: Color.black.opacity(0.3), radius: 8, x: 0, y: 12)
    }
}

// MARK: - Preview

struct PlaceCardView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
