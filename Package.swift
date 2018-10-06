// swift-tools-version:4.2

import PackageDescription

let package = Package(
    name: "StyleDecorator",
    products: [
        .library(name: "StyleDecorator", targets: ["StyleDecorator"])
    ],
    targets: [
        .target(
            name: "StyleDecorator",
            dependencies: [],
            path: "StyleDecorator")
    ]
)
