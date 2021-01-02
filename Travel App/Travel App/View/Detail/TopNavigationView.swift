//
//  TopNavigationView.swift
//  Travel App
//
//  Created by 中筋淳朗 on 2020/12/09.
//

import SwiftUI

struct TopNavigationView: View {
    
    // MARK: - Property
    
    @ObservedObject var manager: PlaceManager
    
    var action: () -> Void
    
    
    // MARK: - Body
    
    var body: some View {
        HStack {
            Button(action: {
                action()
            }, label: {
                Image(systemName: "arrow.backward")
                    .font(.system(size: 22))
            }) //: Button
            
            Spacer(minLength: 0)
            
            Text(manager.placeData[manager.currentIndex].name)
                .font(.system(size: 24))
            
            Spacer(minLength: 0)
            
            Image(systemName: "paperplane")
                .font(.system(size: 22))
        } //: HStack
        .foregroundColor(.white)
        .padding()
        .frame(width: UIScreen.screenWidth)
    }
}

// MARK: - Preview

struct TopNavigationView_Previews: PreviewProvider {
    static let manager = PlaceManager()
    
    static var previews: some View {
        PlaceDetailView(manager: manager)
    }
}
