//
//  FlightView.swift
//  Travel App
//
//  Created by 中筋淳朗 on 2020/12/09.
//

import SwiftUI

struct FlightView: View {
    
    // MARK: - Property
    
    
    // MARK: - Body
    
    var body: some View {
        ZStack {
            
            // MARK: - Background
            RoundedRectangle(cornerRadius: 15)
                .fill(Color.white)
                .frame(width: CGFloat.detailRectWidth, height: 220)
                .shadow(color: Color.black.opacity(0.3), radius: 8, x: 0, y: 12)
            
            VStack {
                
                // MARK: - Top
                HStack {
                    FlightItem(airport: "Bratislava".uppercased(), shortAirport: "BTS", time: "15:00")
                    
                    Spacer()
                    
                    HStack {
                        Image(systemName: "airplane")
                        
                        Text("•••")
                    } //: HStack
                    .foregroundColor(Color.black.opacity(0.8))
                    
                    Spacer()
                    
                    FlightItem(airport: "Esmeralds".uppercased(), shortAirport: "ESM", time: "08:00")
                } //: HStack
                
                Spacer(minLength: 0)
                
                // MARK: - Bottom
                HStack {
                    VStack (alignment: .leading, spacing: 7) {
                        Text("Flight".uppercased())
                            .foregroundColor(.gray)
                            .font(.system(size: 15, weight: .semibold))
                        
                        Text("BE2356")
                            .foregroundColor(Color.black.opacity(0.8))
                    } //: VStack
                    
                    Spacer(minLength: 0)
                    
                    VStack (alignment: .leading, spacing: 7) {
                        Text("Boarding".uppercased())
                            .foregroundColor(.gray)
                            .font(.system(size: 15, weight: .semibold))
                        
                        Text("14:30")
                            .foregroundColor(Color.black.opacity(0.8))
                    } //: VStack
                    
                    Spacer(minLength: 0)
                    
                    Text("KTM")
                        .foregroundColor(.darkOrange)
                        .font(.system(size: 20, weight: .bold))
                } //: HStack
                
            } //: VStack
            .padding(.horizontal, 20)
            .padding(.vertical)
            .frame(width: CGFloat.detailRectWidth)
        } //: ZStack
        .frame(width: UIScreen.screenWidth)
    }
}

// MARK: - Preview

struct FlightView_Previews: PreviewProvider {
    static let manager = PlaceManager()
    
    static var previews: some View {
        PlaceDetailView(manager: manager)
    }
}
