//
//  TitlebarDimensions.swift
//  
//
//  Created by Jochen Bernard on 16/04/2021.
//

import Foundation

/**
 An object containing constant titlebar dimensions.
 
 [Open Reference](https://github.com/JochenBe/CustomTitlebar#titlebardimensions)
*/
public struct TitlebarDimensions {
    private init() {}
    
    /// An object containing constant titlebar heights.
    public struct height {
        /// The height of a statusbar without toolbar.
        static public let withoutToolbar: CGFloat = 28.0
        /// The height of a statusbar with toolbar.
        static public let withToolbar: CGFloat = 52.0
    }
    
    /// An object containing constant titlebar paddings.
    public struct padding {
        /// An object containing constant titlebar left paddings.
        public struct left {
            /// The left padding of a titlebar without toolbar.
            static public let withoutToolbar: CGFloat = 68.0
            /// The left padding of a titlebar with toolbar.
            static public let withToolbar: CGFloat = 92.0
        }
    }
}
