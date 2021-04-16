// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "CustomTitlebar",
    platforms: [
        .macOS(.v10_15)
    ],
    products: [
        .library(
            name: "CustomTitlebar",
            targets: ["CustomTitlebar"]),
    ],
    targets: [
        .target(
            name: "CustomTitlebar",
            dependencies: []),
        .testTarget(
            name: "CustomTitlebarTests",
            dependencies: ["CustomTitlebar"]),
    ]
)
