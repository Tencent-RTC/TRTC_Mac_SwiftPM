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
            url: "https://liteav.sdk.qcloud.com/download/spm/13.4/trtc_mac/13.4.0.21067/TXLiteAVSDK_TRTC_Mac.xcframework.zip",
            checksum: "67e5e78f548b4f88de7cfaaf79ba50844081e4a50b9c982a044674bda04d15aa"
        ),
        .binaryTarget(
            name: "TXFFmpeg",
            url: "https://liteav.sdk.qcloud.com/download/spm/13.4/trtc_mac/13.4.0.21067/TXFFmpeg.xcframework.zip",
            checksum: "98764fe3628023aab431581e2eba30278286bbece8dd3840c2386f43938bbf0c"
        ),
        .binaryTarget(
            name: "TXSoundTouch",
            url: "https://liteav.sdk.qcloud.com/download/spm/13.4/trtc_mac/13.4.0.21067/TXSoundTouch.xcframework.zip",
            checksum: "bca8e039fe374f7065eadadb6943935a2e6dd885a6e548215ecbfebc6ddd400c"
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
