//
//  ContentView.swift
//  Travel App
//
//  Created by 中筋淳朗 on 2020/12/09.
//

import SwiftUI
import MapKit

struct HomeView: View {
    
    // MARK: - Property
    
    @ObservedObject var manager = PlaceManager()
    
    @State var dragOffset: CGFloat = 0
    
    
    // MARK: - Body
    
    var body: some View {
        ZStack (alignment: .bottom) {
            
            // MARK: - Map View
            Map(coordinateRegion: $manager.region, annotationItems: manager.placeData) { place in
                MapAnnotation(coordinate: place.location, anchorPoint: CGPoint(x: 0.5, y: 0.5)) {
                    MapMarkerView(placeName: place.name)
                }
            }
            .edgesIgnoringSafeArea(.all)
            
            // MARK: - Place Card
            
            HStack (spacing: 24) {
                ForEach(manager.placeData) { place in
                    PlaceCardView(place: place)
                        .onTapGesture {
                            withAnimation {
                                manager.selectedPlace = place
                            }
                        }
                } //: ForEach
            } //: HStack
            .offset(x: -CGFloat(manager.currentIndex - 1) * (CGFloat.cardWidth + 24))
            .offset(x: dragOffset)
            .animation(.spring())
            .gesture(
                DragGesture(minimumDistance: 0)
                    .onChanged({ value in
                        scrollDrag(value: value)
                    })
                    .onEnded { value in
                        endDrag(value: value)
                    }
            )
            
            // MARK: - Place Detail
            if manager.selectedPlace != nil {
                PlaceDetailView(manager: manager)
            }
            
        } //: ZStack
    }
    
    
    // MARK: - Function
    
    // ドラッグ中は dragOffset を更新して横にスライドさせる
    func scrollDrag(value: DragGesture.Value) {
        let scrollWidth = value.translation.width
        
        dragOffset = scrollWidth
    }
    
    // ドラッグが終わると
    func endDrag(value: DragGesture.Value) {
        // dragOffset を０にリセットして
        dragOffset = 0
        
        let offset = value.translation.width / CGFloat.cardWidth  // -1 ~ 1
        // 横方向のドラッグが cardWidth の半分を超えたら 四捨五入(rounded)で indexを更新
        let newIndex = Int((CGFloat(manager.currentIndex) - offset).rounded())
        
        // 横方向のドラッグが cardWidth の半分を超えたらページングさせる
        // newIndex が outOfRange にならないように最小値と最大値を指定
        manager.currentIndex = min(max(newIndex, 0), manager.placeData.count - 1)
    }
}

// MARK: - Preview

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
