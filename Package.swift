// swift-tools-version:5.8
import PackageDescription

let package = Package(
    name: "fluent-postgres-driver",
    platforms: [
        .macOS(.v10_15),
        .iOS(.v13),
        .watchOS(.v6),
        .tvOS(.v13),
    ],
    products: [
        .library(name: "FluentPostgresDriver", targets: ["FluentPostgresDriver"]),
    ],
    dependencies: [
        .package(url: "https://github.com/vapor/async-kit.git", from: "1.17.0"),
        .package(url: "https://github.com/grahamburgsma/fluent-kit.git", branch: "returning"),
        .package(url: "https://github.com/vapor/postgres-kit.git", from: "2.11.4"),
    ],
    targets: [
        .target(
            name: "FluentPostgresDriver",
            dependencies: [
                .product(name: "AsyncKit", package: "async-kit"),
                .product(name: "FluentKit", package: "fluent-kit"),
                .product(name: "FluentSQL", package: "fluent-kit"),
                .product(name: "PostgresKit", package: "postgres-kit"),
            ],
            swiftSettings: swiftSettings
        ),
        .testTarget(
            name: "FluentPostgresDriverTests",
            dependencies: [
                .product(name: "FluentBenchmark", package: "fluent-kit"),
                .target(name: "FluentPostgresDriver"),
            ],
            swiftSettings: swiftSettings
        ),
    ]
)

var swiftSettings: [SwiftSetting] { [
    .enableUpcomingFeature("ConciseMagicFile"),
    .enableUpcomingFeature("ForwardTrailingClosures"),
    .enableUpcomingFeature("DisableOutwardActorInference"),
    .enableExperimentalFeature("StrictConcurrency=complete"),
] }
