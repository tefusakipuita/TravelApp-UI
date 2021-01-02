//
//  MapMarker.swift
//  Travel App
//
//  Created by 中筋淳朗 on 2020/12/09.
//

import SwiftUI

struct MapMarkerView: View {
    
    // MARK: - Property
    
    var placeName: String
    
    @State var scaleAnimation = false
    
    
    // MARK: - Body
    
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.pink)
                .frame(width: 10, height: 10)
            
            Circle()
                .fill(Color.pink.opacity(0.25))
                .frame(width: 10, height: 10)
                .opacity(scaleAnimation ? 0 : 1)
                .scaleEffect(scaleAnimation ? 7 : 1)
            
            // GeometryReader を使うと width がほぼ０になって placeName がannotationを起点に始まってくれるから便利
            GeometryReader(content: { geometry in
                ZStack {
                    RoundedRectangle(cornerRadius: 5)
                        .fill(Color.white)
                    
                    Text(placeName)
                        .foregroundColor(Color.black.opacity(0.8))
                        .font(.system(size: 14))
                        .padding(6)
                } //: ZStack
                .fixedSize()
                .offset(x: 25, y: -8)
            })
        } //: ZStack
        .onAppear(perform: {
            withAnimation (Animation.easeOut(duration: 1.3).delay(0.35).repeatForever(autoreverses: false)) {
                scaleAnimation = true
            }
        })
    }
}

// MARK: - Preview

struct MapMarker_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
