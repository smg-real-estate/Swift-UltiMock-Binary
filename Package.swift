// swift-tools-version:6.2
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
            url: "https://github.com/smg-real-estate/Swift-UltiMock-Binary/releases/download/1.0.1/ultimock.artifactbundle.zip",
            checksum: "e56f823e4dd2be5099c63318f993560a1b691dc4bed0f20c65c67a459ae6e66c"
        ),
        .plugin(
            name: "MockGenerationPlugin",
            capability: .buildTool(),
            dependencies: ["ultimock"],
            path: "UltiMock/Plugins/MockGenerationPlugin"
        )
    ]
)
