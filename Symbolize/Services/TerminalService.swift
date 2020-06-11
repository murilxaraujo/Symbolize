//
//  TerminalService.swift
//  Symbolize
//
//  Created by Murilo Araujo on 11/06/20.
//  Copyright © 2020 Murilo Araujo. All rights reserved.
//

import Foundation

class Terminal: NSObject {

    public static func run(_ command: String) -> String {
        let task = Process()
        let pipe = Pipe()

        task.standardOutput = pipe
        task.arguments = ["-c", command]
        task.launchPath = "/bin/bash"
        task.launch()

        let data = pipe.fileHandleForReading.readDataToEndOfFile()
        let output = String(data: data, encoding: .utf8)!

        return output
    }
}
