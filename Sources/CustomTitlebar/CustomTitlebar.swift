//
//  CustomTitlebar.swift
//  
//
//  Created by Jochen Bernard on 16/04/2021.
//

import SwiftUI

public struct CustomTitlebar<Titlebar, Content> : View where Titlebar: View, Content : View {
    @EnvironmentObject var window: ObservableWindowDelegate
    
    private let height: CGFloat
    private let showDivider: Bool
    private let ignoreIsKeyWindow: Bool
    private let titlebar: Titlebar
    private let content: Content
    
    public init(
        titlebar: Titlebar,
        withToolbar: Bool = false,
        showDivider: Bool = true,
        ignoreIsKeyWindow: Bool = false,
        @ViewBuilder content: () -> Content
    ) {
        self.height = withToolbar ? 52.0 : 28.0
        self.showDivider = showDivider
        self.ignoreIsKeyWindow = ignoreIsKeyWindow
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
                        .opacity(
                            ignoreIsKeyWindow
                                ? 1
                                : window.isKeyWindow ? 1 : 0.5
                        )
                        .padding(.top, -height)
                    
                    if (showDivider) {
                        TitlebarDivider()
                            .padding(.top, -8.0)
                    }
                    
                    Spacer()
                }
            }
        }
    }
}

struct CustomTitlebar_Previews: PreviewProvider {
    static var previews: some View {
        CustomTitlebar(
            titlebar: Text("Titlebar"),
            showDivider: false,
            ignoreIsKeyWindow: true
        ) {
            Text("Hello, World!")
        }
        .preferredColorScheme(.light)
        .padding(.top, 28.0)
        
        CustomTitlebar(
            titlebar: Text("Titlebar"),
            withToolbar: true
        ) {
            Text("Hello, World!")
        }
        .environmentObject(ObservableWindowDelegate())
        .preferredColorScheme(.dark)
        .padding(.top, 52.0)
    }
}
