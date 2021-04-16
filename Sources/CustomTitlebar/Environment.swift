//
//  Environment.swift
//  
//
//  Created by Jochen Bernard on 16/04/2021.
//

import SwiftUI

private struct WindowEnvironmentKey: EnvironmentKey {
    static let defaultValue: ObservableWindowDelegate = DefaultObservableWindowDelegate()
}

public extension EnvironmentValues {
    var window: ObservableWindowDelegate {
        get { self[WindowEnvironmentKey.self] }
        set { self[WindowEnvironmentKey.self] = newValue }
    }
}

public extension View {
    func window(_ window: ObservableWindowDelegate) -> some View {
        environment(\.window, window)
    }
}
