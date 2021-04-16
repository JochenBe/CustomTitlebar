//
//  CustomTitlebar.swift
//  
//
//  Created by Jochen Bernard on 16/04/2021.
//

import SwiftUI

public struct CustomTitlebar<Titlebar, Content> : View where Titlebar: View, Content : View {
    private let height: CGFloat
    private let titlebar: Titlebar
    private let content: Content
    
    public init(
        titlebar: Titlebar,
        withToolbar: Bool = false,
        @ViewBuilder content: () -> Content
    ) {
        self.height = withToolbar ? 52.0 : 28.0
        self.titlebar = titlebar
        self.content = content()
    }
    
    public var body: some View {
        GeometryReader { geometry in
            ZStack {
                content
                    .frame(maxHeight: geometry.size.height)
                
                VStack {
                    titlebar
                        .frame(width: geometry.size.width, height: height)
                        .padding(.top, -height)
                    
                    TitlebarDivider()
                    
                    Spacer()
                }
            }
        }
    }
}

@available(OSX 11.0, *)
struct CustomTitlebar_Previews: PreviewProvider {
    static var previews: some View {
        CustomTitlebar(titlebar: Text("Titlebar")) {
            Text("Hello, World!")
        }
        .preferredColorScheme(.light)
        .padding(.top, 28.0)
        
        CustomTitlebar(titlebar: Text("Titlebar"), withToolbar: true) {
            Text("Hello, World!")
        }
        .preferredColorScheme(.dark)
        .padding(.top, 52.0)
    }
}
