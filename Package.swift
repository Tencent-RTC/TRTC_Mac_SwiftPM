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
            url: "https://liteav.sdk.qcloud.com/download/spm/13.3/trtc_mac/13.3.0.20845/TXLiteAVSDK_TRTC_Mac.xcframework.zip",
            checksum: "f92dd5efff27cb173e5b949987cb90947a95653469d608755b1c5ac642ec789e"
        ),
        .binaryTarget(
            name: "TXFFmpeg",
            url: "https://liteav.sdk.qcloud.com/download/spm/13.3/trtc_mac/13.3.0.20845/TXFFmpeg.xcframework.zip",
            checksum: "c50646a9a84a36b213beb4357f99e4699cc2d3e895eb4e2b29d413408614f97e"
        ),
        .binaryTarget(
            name: "TXSoundTouch",
            url: "https://liteav.sdk.qcloud.com/download/spm/13.3/trtc_mac/13.3.0.20845/TXSoundTouch.xcframework.zip",
            checksum: "a03e47fa49573a21f5fa4b5f030d6022893abb79a3a08d2f74ac9346e9efafa1"
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
