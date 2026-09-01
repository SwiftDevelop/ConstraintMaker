// swift-tools-version: 5.7
//
//  Package.swift
//  ConstraintMaker
//
//  Created by SwiftDevelop on 9/1/26.
//

import PackageDescription

let package = Package(
    name: "ConstraintMaker",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "ConstraintMaker",
            targets: ["ConstraintMaker"]
        )
    ],
    targets: [
        .target(
            name: "ConstraintMaker",
            path: "Sources"
        )
    ]
)
