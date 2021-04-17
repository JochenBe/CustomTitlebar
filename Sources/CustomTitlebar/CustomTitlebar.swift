//
//  CustomTitlebar.swift
//  
//
//  Created by Jochen Bernard on 16/04/2021.
//

import SwiftUI

public struct CustomTitlebar<TitlebarContent, WindowContent> : View
where TitlebarContent : View, WindowContent : View {
    @Environment(\.colorScheme) private var colorScheme
    @EnvironmentObject private var window: ObservableWindowDelegate
    
    private let height: CGFloat
    private let showDivider: Bool
    private let ignoreIsKeyWindow: Bool
    private let titlebar: TitlebarContent
    private let content: WindowContent
    
    public init(
        _ titlebar: TitlebarContent,
        withToolbar: Bool = false,
        showDivider: Bool = true,
        ignoreIsKeyWindow: Bool = false,
        @ViewBuilder content: () -> WindowContent
    ) {
        self.height = withToolbar
            ? TitlebarDimensions.height.withToolbar
            : TitlebarDimensions.height.withoutToolbar
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
                    .clipShape(Rectangle())
                
                VStack {
                    titlebar
                        .frame(width: geometry.size.width, height: height)
                        .opacity(
                            ignoreIsKeyWindow
                                ? 1
                                : window.isKeyWindow
                                ? 1
                                :0.4
                        )
                        .padding(.top, -height)
                    
                    if (showDivider) {
                        TitlebarDivider()
                            .padding(.top, -8.0)
                            .allowsHitTesting(false)
                    }
                    
                    Spacer()
                        .allowsHitTesting(false)
                }
                
                if (!ignoreIsKeyWindow && !window.isKeyWindow) {
                    VStack {
                        Rectangle()
                            .fill(Color.gray)
                            .frame(width: geometry.size.width, height: height)
                            .opacity(0.05)
                            .padding(.top, -height)
                        
                        Spacer()
                    }
                    .allowsHitTesting(false)
                }
            }
        }
    }
}

struct CustomTitlebar_Previews: PreviewProvider {
    static var previews: some View {
        CustomTitlebar(
            Titlebar(),
            showDivider: false,
            ignoreIsKeyWindow: true
        ) {
            Text("Hello, World!")
        }
        .padding(.top, TitlebarDimensions.height.withoutToolbar)
        .preferredColorScheme(.light)
        
        CustomTitlebar(
            Titlebar(),
            withToolbar: true
        ) {
            Text("Hello, World!")
        }
        .padding(.top, TitlebarDimensions.height.withToolbar)
        .environmentObject(ObservableWindowDelegate(true))
        .preferredColorScheme(.dark)
    }
}
