//
//  Titlebar.swift
//  
//
//  Created by Jochen Bernard on 17/04/2021.
//

import SwiftUI

struct Titlebar: View {
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        Text("Titlebar")
            .font(.headline)
            .opacity(colorScheme == .dark ? 1 : 0.8)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.gray.opacity(colorScheme == .dark ? 0.15 : 0))
    }
}

struct Titlebar_Previews: PreviewProvider {
    static var previews: some View {
        Titlebar()
            .preferredColorScheme(.light)
            .frame(
                width: 384.0,
                height: TitlebarDimensions.height.withToolbar
            )
        
        Titlebar()
            .preferredColorScheme(.dark)
            .frame(
                width: 384.0,
                height: TitlebarDimensions.height.withToolbar
            )
    }
}
