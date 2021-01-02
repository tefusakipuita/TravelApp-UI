//
//  ActivityView.swift
//  Travel App
//
//  Created by 中筋淳朗 on 2020/12/09.
//

import SwiftUI

struct ActivityView: View {
    
    // MARK: - Property
    
    let activity: Activity
    
    
    // MARK: - Body
    
    var body: some View {
        ZStack (alignment: .bottom) {
            
            // MARK: - Background Image
            Image(activity.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: CGFloat.detailRectWidth, height: 320)
                .clipped()
            
            // MARK: - Info
            ZStack (alignment: .topLeading) {
                RoundedRectangle(cornerRadius: 15)
                    .fill(Color.black.opacity(0.4))
                    .frame(width: CGFloat.detailRectWidth - 40, height: 190)
                
                VStack (alignment: .leading) {
                    // MARK: - Title
                    Text(activity.title)
                        .font(.system(size: 26, weight: .regular))
                        .background(
                            LineShape()
                                .stroke(lineWidth: 0.6)
                                .fill(Color.white)
                                .offset(y: 22)
                        )
                        .padding(.bottom, 8)
                        
                    // MARK: - Address
                    Group {
                        Text("Address".uppercased())
                            
                        Text(activity.address)
                            .font(.system(size: 14, weight: .light))
                            .frame(height: 34, alignment: .top)
                    }
                    
                    HStack (spacing: 28) {
                        // MARK: - Duration
                        VStack (alignment: .leading, spacing: 5) {
                            Text("Duration".uppercased())
                            
                            Text(activity.duration)
                                .font(.system(size: 14, weight: .light))
                        } //: VStack
                        
                        // MARK: - Occupancy
                        VStack (alignment: .leading, spacing: 5) {
                            Text("Occupancy".uppercased())
                            
                            Text(activity.occupancy)
                                .font(.system(size: 14, weight: .light))
                        } //: VStack
                    } //: HStack
                    .padding(.top, 10)
                    
                    Spacer()
                } //: VStack
                .foregroundColor(.white)
                .padding(.horizontal, 16)
                .padding(.vertical, 14)
                .frame(width: CGFloat.detailRectWidth - 40, height: 190, alignment: .leading)
            } //: ZStack
            .padding(.bottom, 32)
            .frame(height: 190)
            
        } //: ZStack
        .cornerRadius(15)
        .shadow(color: Color.black.opacity(0.2), radius: 8, x: 0, y: 12)
    }
}

// MARK: - Preview

struct ActivityView_Previews: PreviewProvider {
    static let manager = PlaceManager()
    
    static var previews: some View {
        PlaceDetailView(manager: manager)
    }
}
