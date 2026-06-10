// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "Objective-LevelDB",
    platforms: [
        .iOS(.v8),
        .macOS(.v10_10),
    ],
    products: [
        .library(
            name: "Objective-LevelDB",
            targets: ["ObjectiveLevelDB"]
        ),
    ],
    dependencies: [
        .package(
            url: "https://github.com/firebase/leveldb.git",
            from: "1.22.5"
        ),
    ],
    targets: [
        .target(
            name: "ObjectiveLevelDB",
            dependencies: [
                .product(name: "leveldb", package: "leveldb"),
            ],
            path: "Classes",
            publicHeadersPath: ".",
            cxxSettings: [
                .unsafeFlags(["-fno-objc-arc"]),
            ],
            linkerSettings: [
                .linkedFramework("Foundation"),
            ]
        ),
        .testTarget(
            name: "ObjectiveLevelDBTests",
            dependencies: ["ObjectiveLevelDB"],
            path: "Tests",
            exclude: [
                "Podfile",
                "Dummy.cpp",
                "Dummy.h",
                "iOS Tests",
                "Objective-LevelDB iOS Tests.xcodeproj",
                "Objective-LevelDB OS X Tests.xcodeproj",
                "OS X Tests",
            ]
        ),
    ],
    cxxLanguageStandard: .cxx11
)
