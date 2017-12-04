// swift-tools-version:4.0

import PackageDescription

let package = Package(
    name: "SwaggerStencil",
    products: [
        .library(
            name: "SwaggerStencil",
            type: .static,
            targets: ["SwaggerStencil"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/SwiftGen/StencilSwiftKit.git", from: "2.3.0"),
        .package(url: "https://github.com/AttilaTheFun/SwaggerParser.git", from: "0.6.1"),
        .package(url: "https://github.com/behrang/YamlSwift.git", from: "3.4.0")
    ],
    targets: [
        .target(
            name: "SwaggerStencil",
            dependencies: [
                .product(name: "StencilSwiftKit"),
                .product(name: "SwaggerParser"),
            ],
            path: "Sources"
        ),
        .testTarget(
            name: "SwaggerStencilTests",
            dependencies: [
                .product(name: "Yaml"),
            ],
            path: "Tests"
        ),
    ]
)
