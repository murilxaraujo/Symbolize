//
//  AtosService.swift
//  Symbolize
//
//  Created by Murilo Araujo on 11/06/20.
//  Copyright © 2020 Murilo Araujo. All rights reserved.
//

import Foundation

class AtosService: NSObject {
    static public func makeCommand(arch: String, dsymPath: String, firstParam: String, secondParam: String) -> String {
       //"atos -arch arm64 -o \(filePathTextField.stringValue) -l \(firstTextField.stringValue) \(secondTextField.stringValue)"
        var command = ""
        command += "atos -arch \(arch) -o "
        command += dsymPath
        command += " -l "
        command += firstParam
        command += " "
        command += secondParam
        return command
    }
}
