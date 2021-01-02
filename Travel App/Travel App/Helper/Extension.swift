//
//  Extension.swift
//  Travel App
//
//  Created by 中筋淳朗 on 2020/12/09.
//

import SwiftUI



extension Color {
    
    static let darkBlue = Color("darkBlue")
    static let lightBlue = Color("lightBlue")
    
    static let lightOrange = Color("lightOrange")
    static let darkOrange = Color("darkOrange")
    
    
    static let backgroundGradient = LinearGradient(gradient: Gradient(colors: [Color.lightBlue, Color.darkBlue]), startPoint: .top, endPoint: .bottom)
    
    static let buttonOrangeGradient = LinearGradient(gradient: Gradient(colors: [Color.lightOrange, Color.darkOrange]), startPoint: .leading, endPoint: .trailing)
}


extension UIScreen {
    
    static let screenWidth = UIScreen.main.bounds.width
    static let screenHeight = UIScreen.main.bounds.height
}


extension CGFloat {
    
    static let cardWidth = UIScreen.screenWidth - 100
    
    static let detailRectWidth = UIScreen.screenWidth - 50
}
