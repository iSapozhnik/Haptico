// swift-tools-version:5.1
import PackageDescription

let package = Package(
    name: "Haptico",
    platforms: [
        .iOS(.v13),
    ],
    products: [
        .library(name: "Haptico", targets: ["Haptico"])
    ],
    targets: [
        .target(name: "Haptico"),
    ]
)
