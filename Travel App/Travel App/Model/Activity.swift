//
//  Activity.swift
//  Travel App
//
//  Created by 中筋淳朗 on 2020/12/09.
//

import SwiftUI

struct Activity: Identifiable {
    
    var id = UUID()
    var title: String
    var imageName: String
    var address: String
    var duration: String
    var occupancy: String
    var needBooking: Bool
    var price: String
    var previousPrice: String
}
