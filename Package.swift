// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "StyleDecorator",
    products: [
        .library(
            name: "StyleDecorator",
            targets: ["StyleDecorator"]),
    ],
    targets: [
        .target(
            name: "StyleDecorator",
            dependencies: []),
        .testTarget(
            name: "StyleDecoratorTests",
            dependencies: ["StyleDecorator"]),
    ]
)
