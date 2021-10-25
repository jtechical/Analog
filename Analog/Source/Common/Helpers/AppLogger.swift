//
//  AppLogger.swift
//  Analog
//
//  Created by Maksym Soroka on 22.10.2021.
//
// swiftlint:disable debug_rule
// swiftlint:disable foundation_using

import Foundation

final class Debugger {
    static var isDebug: Bool {
    #if DEBUG
        return true
    #else
        return false
    #endif
    }

    static var isRelease = !isDebug
    /// Use this method in debug scheme
    /// - Parameter debugHandler: this closure will be execute only in debug scheme
    class func run(_ debugHandler: () -> Void) {
        if isDebug { debugHandler() }
    }
    /// Use this method in debug or release scheme
    /// - Parameters:
    ///  - debugHandler: this closure will be execute only in debug scheme
    ///  - releaseHandler: this closure will be execute only in release scheme
    class func run(_ debugHandler: () -> Void, releaseHandler: (() -> Void)) {
        isDebug ? debugHandler() : releaseHandler()
    }
}

final class AppLogger {
    enum Level: String {
        case debug = "😈"
        case info = "ℹ️"
        case success = "🟢"
        case warning = "⚠️"
        case error = "🚫"
        case exeption = "❗️"
    }
    private init() {}
    static var displayLog: Bool {
    #if PRODUCTION
        return false
    #else
        return true
    #endif
    }
    static func log(level: Level = .debug, _ message: Any..., filePath: String = #file, function: String = #function, line: Int = #line) {
        for message in message {
            customPrint(message, level: level, filePath: filePath, function: function, line: line)
        }
    }
    private static func customPrint(_ message: Any, level: Level, filePath: String, function: String, line: Int, toFile: Bool = false) {
        guard displayLog else { return }
        let fileName = filePath.components(separatedBy: "/").last?.components(separatedBy: ".").first ?? "unkonwn_file_name"
        let stringToPrint = "\(Date()) \(level.rawValue) \(fileName).swift => \(function) => at line \(line) => \(message)"
        Debugger.run({
            print(stringToPrint)
        }, releaseHandler: {
            print("RELEASE SCHEME: \(stringToPrint)")
        })
    }
}
