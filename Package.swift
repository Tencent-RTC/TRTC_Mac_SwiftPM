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
            url: "https://liteav.sdk.qcloud.com/download/spm/13.6/trtc_mac/13.6.0.21648/TXLiteAVSDK_TRTC_Mac.xcframework.zip",
            checksum: "fb46c231ee6a7420f045bbdebcdf83d66700c787bec6102988c21111ace3f4db"
        ),
        .binaryTarget(
            name: "TXFFmpeg",
            url: "https://liteav.sdk.qcloud.com/download/spm/13.6/trtc_mac/13.6.0.21648/TXFFmpeg.xcframework.zip",
            checksum: "4d5b8f9604dd57ec3a7ff66b24326bac77de42d5bbf50300a64a26b7d263720b"
        ),
        .binaryTarget(
            name: "TXSoundTouch",
            url: "https://liteav.sdk.qcloud.com/download/spm/13.6/trtc_mac/13.6.0.21648/TXSoundTouch.xcframework.zip",
            checksum: "0d16309f9315cf67b69521629fff320c61c1b3645d9cae1aceb65e5e81017a26"
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
