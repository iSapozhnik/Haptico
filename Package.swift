// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "Haptico",
    platforms: [
        .iOS(.v9),
    ],
    products: [
        .library(name: "Haptico", targets: ["Haptico"])
    ],
    targets: [
        .target(name: "Haptico"),
    ]
)