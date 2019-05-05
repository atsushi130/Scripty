
import Foundation

public struct Scripty {
    
    fileprivate let script: String?
    
    public static var builder: Scripty {
        return Scripty()
    }
    
    public init(_ script: String? = nil) {
        self.script = script
    }
    
    public func makeProcess() -> Process? {
        guard let script = self.script else { return nil }
        return Process.make(script: script)
    }
    
    @discardableResult
    public func exec() -> Process? {
        let process = self.makeProcess()
        process?.launchWithWaitUntilExit()
        return process
    }
}

// MARK: pipe operator
public extension Scripty {
    static func | (lhs: Scripty, rhs: String) -> Scripty {
        if let script = lhs.script {
            return Scripty(script + "|" + rhs)
        } else {
            return Scripty(rhs)
        }
    }
}
