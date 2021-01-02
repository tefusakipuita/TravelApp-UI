//
//  FlightItem.swift
//  Travel App
//
//  Created by 中筋淳朗 on 2020/12/09.
//

import SwiftUI

struct FlightItem: View {
    
    // MARK: - Property
    
    let airport: String
    let shortAirport: String
    let time: String
    
    
    // MARK: - Body
    
    var body: some View {
        VStack (alignment: .leading, spacing: 0) {
            Text(airport)
                .foregroundColor(.gray)
            
            Text(shortAirport)
                .foregroundColor(Color.black.opacity(0.8))
                .font(.system(size: 36, weight: .semibold))
                .padding(.bottom, 6)
            
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.buttonOrangeGradient)
                    .frame(width: 70, height: 40)
                
                Text(time)
                    .foregroundColor(.white)
                    .font(.system(size: 22))
            } //: ZStack
        } //: VStack
    }
}

// MARK: - Preview

struct FlightItem_Previews: PreviewProvider {
    static let manager = PlaceManager()
    
    static var previews: some View {
        PlaceDetailView(manager: manager)
    }
}
