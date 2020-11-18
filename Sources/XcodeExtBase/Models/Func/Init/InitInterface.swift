

/// init?(_ str1: Str?, _ str2: Str?) 
public struct InitInterface: SwiftT { 
    
    // can be empty
    public var args: [FuncArg]
    
    public var optional: Bool
    
    // can be absent
    public var access: AccessMod?
}
public extension InitInterface {

    init(args: [FuncArg] = [],
         optional: Bool = false,
         _ access: AccessMod? = nil) {
        
        self.args = args
        self.optional = optional
        self.access = access
    }
    
    /// init?(_ str1: Str?, _ str2: Str?) { self.a = a }
    var str: Str {
        var r = "init"
        if optional {
            r += "?"
        }
        let argStr = args.map{$0.argStr}.joined(separator: ", ")
        r += "(\(argStr))"
        if let mod = access {
            r += mod.s
        }
        return r
    }
}

