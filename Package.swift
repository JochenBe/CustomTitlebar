// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "CustomTitlebar",
    platforms: [
        .macOS(.v11)
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
