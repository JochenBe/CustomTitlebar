//
//  ObservableWindowDelegate.swift
//  
//
//  Created by Jochen Bernard on 16/04/2021.
//

import SwiftUI

public class ObservableWindowDelegate: NSObject, NSWindowDelegate, ObservableObject {
    @Published public var isKeyWindow = false
    
    public func windowDidBecomeKey(_ notification: Notification) {
        isKeyWindow = true
    }
    
    public func windowDidResignKey(_ notification: Notification) {
        isKeyWindow = false
    }
}
