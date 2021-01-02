//
//  PlaceManager.swift
//  Travel App
//
//  Created by 中筋淳朗 on 2020/12/09.
//

import SwiftUI
import MapKit

class PlaceManager: ObservableObject {
    
    @Published var placeData = Data.places
    
    @Published var currentIndex = 0 {
        // curerntIndex が更新れたら、region の center の座標も更新する
        //  - 0.03 で annotationの位置を上にズラして見やすくする (annotationの座標を変えるわけにはいかないので、Mapのcenterの座標をズラす)
        willSet {
            region.center = CLLocationCoordinate2D(
                latitude: placeData[newValue].location.latitude - 0.03,
                longitude: placeData[newValue].location.longitude)
        }
    }
    
    @Published var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(
            latitude: Data.places[0].location.latitude - 0.03,
            longitude: Data.places[0].location.longitude),
        span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
    
    @Published var selectedPlace: Place?
}
