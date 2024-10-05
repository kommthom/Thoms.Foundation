// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Thoms.Foundation",
	platforms: [
		.macOS(.v15),
		.iOS(.v18),
		.tvOS(.v16),
		.watchOS(.v8)
		],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "Thoms.Foundation",
            targets: ["Thoms.Foundation"]),
    ],
	dependencies: [
		//.package(name: "UserDTOs", url: "https://github.com/kommthom/UserDTOs.git", branch: "main")
		//.package(name: "UserDTOs", path: "../UserDTOs")
	],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "Thoms.Foundation",
			dependencies: []
		),
        .testTarget(
            name: "Thoms.Foundation.Tests",
            dependencies: ["Thoms.Foundation"]
        ),
    ]
)
