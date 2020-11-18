

/// func print(_ str1: Str?, _ str2: Str?) -> Str?
public struct FuncInterface: SwiftP, CanBeStaticP {  //SwiftT
    
    public var name: Str
    
    // can be empty
    public var args: [FuncArg]
    
    public var returnType: TypeName?
    
    public var access: AccessMod?
    
    public var _static: Bool
}

public extension FuncInterface {

    init(name: Str,
         args: [FuncArg] = [],
         returnType: TypeName? = nil,
         _static: Bool = false,
         _ access: AccessMod? = nil) {
        
        self.name = name
        self.args = args
        self.returnType = returnType
        self.access = access
        self._static = _static
    }
    

    //MARK: -

    /// func print(_ str1: Str?, _ str2: Str?) -> Str?
    var str: Str {
        let argStr = args.map{$0.argStr}.joined(separator: ", ")
        var r = "func " + name + "(\(argStr))"
        if let rtype = returnType {
            r += " -> \(rtype.str)"
        }
        if let mod = access {
            r += mod.s
        }
        return r
    }
}

