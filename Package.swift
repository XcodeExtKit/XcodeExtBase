// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "XcodeExtBase",
    platforms: [
        .macOS(.v10_15) //, .iOS(.v14) //, .tvOS(.v10), .watchOS(.v4)
    ],
    products: [
        .library(
            name: "XcodeExtBase",
            targets: ["XcodeExtBase"]),
    ],
    dependencies: [
        // .package(url: "../../Base", .exact("1.0.0")),
        .package(url: "https://github.com/bretsko/Base", .exact("1.0.0")),
    
        
        // .package(url: "../../Quick/Quick", .exact("1.0.0")),
        // .package(url: "../../Quick/Nimble", .exact("1.0.0")),
        .package(url: "https://github.com/bretsko/Quick", from: "2.2.1"),
        .package(url: "https://github.com/bretsko/Nimble", from: "8.0.5"),
    ],
    targets: [
        .target(
            name: "XcodeExtBase",
            dependencies: ["Base"]),

        .testTarget(
            name: "XcodeExtBaseTests",
            dependencies: ["XcodeExtBase", "Quick", "Nimble"]),
    ]
)










