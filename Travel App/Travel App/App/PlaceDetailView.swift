//
//  PlaceDetailView.swift
//  Travel App
//
//  Created by 中筋淳朗 on 2020/12/09.
//

import SwiftUI

struct PlaceDetailView: View {
    
    // MARK: - Property
    
    @ObservedObject var manager: PlaceManager
    
    @State var dismissAnimation = false
    
    @State var topNavOpactiy: CGFloat = 0
    
    
    // MARK: - Body
    
    var body: some View {
        ZStack {
            
            // MARK: - Background
            Color.backgroundGradient
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                ScrollView (showsIndicators: false) {
                    
                    GeometryReader(content: { geometry in
                        let minY = geometry.frame(in: .global).minY
                        let scrollOpacity = (-minY + 178) / 50
                    
                        // MARK: - Flight View
                        FlightView()
                            .onChange(of: minY, perform: { value in
                                topNavOpactiy = max(min(scrollOpacity, 1), 0)
                                print("\(minY)")
                            })
                    }) //: GeometryReader
                    .frame(height: 220)
                    .padding(.bottom, 16)
                    .padding(.top, 80 + (UIApplication.shared.windows.first?.safeAreaInsets.top)!)
                    
                    // MARK: - Activity View
                    ForEach(manager.selectedPlace?.activities ?? Data.activities1) { activity in
                        ActivityView(activity: activity)
                            .padding(.bottom, 16)
                    }
                } //: Scroll
                
                Spacer()
                
            } //: VStack
            
            // MARK: - Top Nav
            VStack {
                TopNavigationView(manager: manager) {
                    withAnimation (.easeOut(duration: 0.4)) {
                        dismissAnimation = true
                    }
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                        manager.selectedPlace = nil
                    }
                }
                .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
                .background(
                    Color.lightBlue.opacity(0.7)
                        .opacity(Double(topNavOpactiy))
                )
                
                Spacer()
            } //: VStack
            
        } //: ZStack
        .frame(width: UIScreen.screenWidth)
        .edgesIgnoringSafeArea(.all)
        .opacity(dismissAnimation ? 0 : 1)
        .scaleEffect(dismissAnimation ? 0 : 1, anchor: .bottom)
    }
}

// MARK: - Preview

struct PlaceDetailView_Previews: PreviewProvider {
    static let manager = PlaceManager()
    
    static var previews: some View {
        PlaceDetailView(manager: manager)
    }
}
