// swift-tools-version: 6.0.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "TRTC_Mac_SwiftPM",
    platforms: [
        .macOS(.v10_13)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "TRTC_Mac_SwiftPM",
            targets: ["TRTC_Mac_SwiftPM"]
        ),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .binaryTarget(
            name: "TXLiteAVSDK_TRTC_Mac",
            url: "https://liteav.sdk.qcloud.com/download/spm/13.5/trtc_mac/13.5.0.21355/TXLiteAVSDK_TRTC_Mac.xcframework.zip",
            checksum: "423ebb1a26f9312768d401a04fc627bc9a558381ec6bbb6bcb4466ee518ea531"
        ),
        .binaryTarget(
            name: "TXFFmpeg",
            url: "https://liteav.sdk.qcloud.com/download/spm/13.5/trtc_mac/13.5.0.21355/TXFFmpeg.xcframework.zip",
            checksum: "768d883b4bd67fe1a4cbf026ede09898d267f2bda87339e20f22a95e13dc2827"
        ),
        .binaryTarget(
            name: "TXSoundTouch",
            url: "https://liteav.sdk.qcloud.com/download/spm/13.5/trtc_mac/13.5.0.21355/TXSoundTouch.xcframework.zip",
            checksum: "44ba869eb82940c24270c82bc05301ba609eb6b298114a28e8f2138a6c6b749a"
        ),

        .target(
            name: "TRTC_Mac_SwiftPM",
            dependencies: [
                .target(name: "TXLiteAVSDK_TRTC_Mac"),
                .target(name: "TXFFmpeg"),
                .target(name: "TXSoundTouch"),
            ],
            path: "Sources/TRTC_Mac_SwiftPM",
            linkerSettings: [
                .linkedFramework("AudioUnit"),
                .linkedFramework("OpenAL"),
                .linkedFramework("Accelerate"),
                .linkedFramework("Metal"),
                .linkedFramework("MetalKit"),
                .linkedFramework("OpenGL"),
                .linkedFramework("SystemConfiguration"),
                .linkedLibrary("c++"),
                .linkedLibrary("resolv"),
                .linkedLibrary("bz2"),
                .linkedLibrary("lzma"),
            ]
        ),
    ]
)
