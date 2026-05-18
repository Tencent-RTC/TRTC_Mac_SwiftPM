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
            url: "https://liteav.sdk.qcloud.com/download/spm/13.3/trtc_mac/13.3.0.20856/TXLiteAVSDK_TRTC_Mac.xcframework.zip",
            checksum: "45ab4ac6388a76226e48fbdd90134b15b5328f8dd1a5e1ca9f22a51ee3eae09e"
        ),
        .binaryTarget(
            name: "TXFFmpeg",
            url: "https://liteav.sdk.qcloud.com/download/spm/13.3/trtc_mac/13.3.0.20856/TXFFmpeg.xcframework.zip",
            checksum: "a2767ff7613a1d1481d571419d7de3c36845d0654d34eae8b722babd8206cb8e"
        ),
        .binaryTarget(
            name: "TXSoundTouch",
            url: "https://liteav.sdk.qcloud.com/download/spm/13.3/trtc_mac/13.3.0.20856/TXSoundTouch.xcframework.zip",
            checksum: "2f3b760a0f70fb26fb7b5e07180abbb2666e34717212e1b10b667fa7f7b30938"
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
