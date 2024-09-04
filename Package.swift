// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "CapacitorDocumentScanner",
    platforms: [.iOS(.v13)],
    products: [
        .library(
            name: "CapacitorDocumentScanner",
            targets: ["DocumentScannerSwift", "DocumentScannerObjC"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/ionic-team/capacitor-swift-pm.git", branch: "main")
    ],
    targets: [
        .target(
            name: "DocumentScannerSwift",
            dependencies: [
                .product(name: "Capacitor", package: "capacitor-swift-pm"),
                .product(name: "Cordova", package: "capacitor-swift-pm")
            ],
            path: "ios/Plugin",
            exclude: ["DocumentScannerPlugin.h", "DocumentScannerPlugin.m"]
        ),
        .target(
            name: "DocumentScannerObjC",
            dependencies: [],
            path: "ios/Plugin",
            sources: ["DocumentScannerPlugin.h", "DocumentScannerPlugin.m"],
            publicHeadersPath: "."
        ),
        .testTarget(
            name: "DocumentScannerPluginTests",
            dependencies: ["DocumentScannerSwift", "DocumentScannerObjC"],
            path: "ios/Tests/DocumentScannerPluginTests"
        )
    ]
)
