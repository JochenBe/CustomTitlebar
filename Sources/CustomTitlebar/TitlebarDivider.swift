//
//  TitlebarDivider.swift
//  
//
//  Created by Jochen Bernard on 16/04/2021.
//

import SwiftUI

struct TitlebarDivider: View {
    @Environment(\.colorScheme) private var colorScheme
    
    var body: some View {
        let fillColor = colorScheme == .dark
            ? Color.black
            : Color.black.opacity(0.15)
        
        VStack {
            Rectangle()
                .fill(fillColor)
                .frame(height: 0.5)
            
            Rectangle()
                .fill(fillColor.opacity(0.3))
                .frame(height: 0.5)
                .padding(.top, -8)
        }
    }
}

struct TitlebarDivider_Previews: PreviewProvider {
    static var previews: some View {
        TitlebarDivider()
            .preferredColorScheme(.light)
        
        TitlebarDivider()
            .preferredColorScheme(.dark)
    }
}
