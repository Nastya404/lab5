
// swift-tools-version: 5.9

import PackageDescription

let package = Package(

    name: "task7",

    targets: [

        .executableTarget(

            name: "task7",

            path: "Sources/task7"

        ),

        .testTarget(

            name: "TestsTask7",

            dependencies: ["task7"],

            path: "Tests/TestsTask7"

        ),

    ]

)

