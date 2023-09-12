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
            url: "https://api.github.com/repos/smg-real-estate/Swift-UltiMock-Binary/releases/assets/125713553.zip",
            checksum: "6a1e408a1f295c9c9e525a879ad01a7080d11cb0d0e5e7202c1a1958b22a10b5"
        ),
        .plugin(
            name: "MockGenerationPlugin",
            capability: .buildTool(),
            dependencies: ["ultimock"],
            path: "UltiMock/Plugins/MockGenerationPlugin"
        )
    ]
)
