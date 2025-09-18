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
            url: "https://github.com/smg-real-estate/Swift-UltiMock-Binary/releases/download/0.6.4/ultimock.artifactbundle.zip",
            checksum: "77a08a400e58a032c7db45170c91855942104057c120548757e954060bb06fdf"
        ),
        .plugin(
            name: "MockGenerationPlugin",
            capability: .buildTool(),
            dependencies: ["ultimock"],
            path: "UltiMock/Plugins/MockGenerationPlugin"
        )
    ]
)
