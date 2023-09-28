// swift-tools-version:5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import Foundation
import PackageDescription

let package = Package(
    name: "UltiMock",
    platforms: [.iOS(.v15), .macOS(.v13)],
    products: [
        .library(
            name: "UltiMock",
            targets: ["UltiMock"]
        ),
        .plugin(
            name: "MockGenerationPlugin",
            targets: ["MockGenerationPlugin"]
        )
    ],
    targets: [
        .target(
            name: "UltiMock",
            dependencies: ["XCTestExtensions"],
            path: "UltiMock/Sources/UltiMock"
        ),
        .target(
            name: "XCTestExtensions",
            path: "UltiMock/Sources/XCTestExtensions"
        ),
        .binaryTarget(
            name: "ultimock",
            url: "https://api.github.com/repos/smg-real-estate/Swift-UltiMock-Binary/releases/assets/128168516.zip",
            checksum: "32aac05e9618023901d66914c3f020cce986a3850d5067faad12be5ea232caba"
        ),
        .plugin(
            name: "MockGenerationPlugin",
            capability: .buildTool(),
            dependencies: ["ultimock"],
            path: "UltiMock/Plugins/MockGenerationPlugin"
        )
    ]
)
