//
//  Place.swift
//  Travel App
//
//  Created by 中筋淳朗 on 2020/12/09.
//

import SwiftUI
import MapKit

struct Place: Identifiable {
    
    var id = UUID()
    var index: Int
    var name: String
    var date: String
    var imageName: String
    var location: CLLocationCoordinate2D
    var departureDayLeft: String
    var activities: [Activity]
}
