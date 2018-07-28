
import Foundation

public struct Script {
    
    fileprivate let script: String
    
    public init(_ script: String) {
        self.script = script
    }
    
    public func exec() {
        Process.launchedProcess(launchPath: "/bin/sh", arguments: ["-c", self.script]).waitUntilExit()
    }
}

infix operator |
public func | (lhs: Script, rhs: String) -> Script {
    return Script(lhs.script + "|" + rhs)
}
