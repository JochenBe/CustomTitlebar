//
//  ObservableWindowDelegate.swift
//  
//
//  Created by Jochen Bernard on 16/04/2021.
//

import SwiftUI

/// An observable version of NSWindowDelegate.
public class ObservableWindowDelegate: NSObject, NSWindowDelegate, ObservableObject {
    /// A Boolean value that indicates whether the window is the key window for the application.
    @Published public var isKeyWindow: Bool
    
    /**
     Initializes a new ObservableWindowDelegate.
     
     - Parameters:
        - isKeyWindow: The initial value of isKeyWindow.
     */
    public init(_ isKeyWindow: Bool = false) {
        self.isKeyWindow = isKeyWindow
        super.init()
    }
    
    public func windowDidBecomeKey(_ notification: Notification) {
        isKeyWindow = true
    }
    
    public func windowDidResignKey(_ notification: Notification) {
        isKeyWindow = false
    }
}
