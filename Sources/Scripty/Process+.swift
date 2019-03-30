//
//  Process+.swift
//  Scripty
//
//  Created by Atsushi Miyake on 2019/03/31.
//

import Foundation

extension Process {
    
    static func make(script: String) -> Process {
        let process = Process()
        process.launchPath = "/bin/sh"
        process.arguments = ["-c", script]
        return process
    }
    
    func launchWithWaitUntilExit() {
        self.launch()
        self.waitUntilExit()
    }
}
