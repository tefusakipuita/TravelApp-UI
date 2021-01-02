//
//  InfoItemView.swift
//  Travel App
//
//  Created by 中筋淳朗 on 2020/12/09.
//

import SwiftUI

struct InfoItemView: View {
    
    // MARK: - Property
    
    let title: String
    let description: String
    
    
    // MARK: - Body
    
    var body: some View {
        ZStack {
            
        } //: ZStack
    }
}

// MARK: - Preview

struct InfoItemView_Previews: PreviewProvider {
    static let manager = PlaceManager()
    
    static var previews: some View {
        PlaceDetailView(manager: manager)
    }
}
