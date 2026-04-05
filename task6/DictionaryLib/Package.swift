// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "DictionaryLib",
    platforms: [
        .macOS(.v10_15),
    ],
    products: [
        .library(name: "DictionaryLib", targets: ["DictionaryLib"]),
    ],
    targets: [
        .target(
            name: "DictionaryLib",
            path: "Sources/DictionaryLib"
        ),
        .testTarget(
            name: "DictionaryLibTests",
            dependencies: ["DictionaryLib"],
            path: "Tests/DictionaryLibTests"
        ),
    ]
)
