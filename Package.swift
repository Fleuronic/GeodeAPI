// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "GeodeAPI",
    platforms: [
        .iOS(.v13),
        .macOS(.v10_15),
        .tvOS(.v13),
        .watchOS(.v6),
    ],
    products: [
        .library(
            name: "GeodeAPI",
            targets: ["GeodeAPI"]
        ),
    ],
    dependencies: [
		.package(path: "../../Submodules/GeodeService"),
        .package(url: "https://github.com/Fleuronic/Caesura", branch: "main"),
    ],
    targets: [
        .target(
            name: "GeodeAPI",
            dependencies: [
                "GeodeService",
                "Caesura",
            ]
        ),
    ]
)
