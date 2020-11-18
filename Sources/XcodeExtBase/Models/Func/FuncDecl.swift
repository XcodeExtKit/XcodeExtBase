

/// func print(_ str1: Str?, _ str2: Str?) -> Str? { ... }
public struct FuncDecl: SwiftP, CanBeStaticP {  //SwiftT
    
    public var interface: FuncInterface
    
    /// body
    public var statements: [Str]
}
public extension FuncDecl {
    
    init(_ interface: FuncInterface,
         _ statements: [Str] = []) {
        self.interface = interface
        self.statements = statements
    }
    
    init(name: Str,
         statements: [Str],
         args: [FuncArg] = [],
         returnType: TypeName? = nil,
         _static: Bool = false,
         _ access: AccessMod? = nil) {
        let interface = FuncInterface(name: name,
                                args: args,
                                returnType: returnType,
                                _static: _static, access)
        self.init(interface, statements)
    }
    
    var _static: Bool {
        get {
            interface._static
        }
        set {
            interface._static = newValue
        }
    }
    
    
    //MARK: -
    
    var name: Str {
        get {
            interface.name
        }
        set {
            interface.name = newValue
        }
    }
    
    // can be empty
    var args: [FuncArg] {
        get {
            interface.args
        }
        set {
            interface.args = newValue
        }
    }
    
    var returnType: TypeName? {
        get {
            interface.returnType
        }
        set {
            interface.returnType = newValue
        }
    }
    
    // can be absent
    var access: AccessMod? {
        get {
            interface.access
        }
        set {
            interface.access = newValue
        }
    }
    
    
    //MARK: -
    
    /// func print(_ str1: Str?, _ str2: Str?) -> Str? { ... }
    func str(usesTabs: Bool = false,
             tabIndent: Int = 4) -> Str {
        interface.str + wrap(statements,
                             usesTabs:usesTabs,
                             tabIndent:tabIndent)
    }
}

