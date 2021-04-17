//
//  TitlebarDimensions.swift
//  
//
//  Created by Jochen Bernard on 16/04/2021.
//

import Foundation

public struct TitlebarDimensions {
    private init() {}
    
    public struct height {
        static public let withoutToolbar: CGFloat = 28.0
        static public let withToolbar: CGFloat = 52.0
    }
    
    public struct padding {
        public struct left {
            static public let withoutToolbar: CGFloat = 68.0
            static public let withToolbar: CGFloat = 92.0
        }
    }
}
