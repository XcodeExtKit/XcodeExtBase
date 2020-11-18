

/// init?(_ str1: Str?, _ str2: Str?) {}
public struct InitDecl: SwiftT {
    
    public var interface: InitInterface
    
    /// body
    public var statements: [Str]
}
public extension InitDecl {
    
    init(_ interface: InitInterface,
         statements: [Str] = []) {
        self.interface = interface
        self.statements = statements
    }
    
    init(name: Str,
         statements: [Str],
         args: [FuncArg] = [],
         optional: Bool = false,
         _ access: AccessMod? = nil) {
        
        let interface = InitInterface(args: args,
                                      optional: optional,
                                      access: access)
        self.init(interface, statements: statements)
    }
    
    
    //MARK: -
    
    
    // can be empty
    var args: [FuncArg] {
        get {
            interface.args
        }
        set {
            interface.args = newValue
        }
    }
    
    var optional: Bool {
        get {
            interface.optional
        }
        set {
            interface.optional = newValue
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
    
    /// init?(_ str1: Str?, _ str2: Str?) { self.a = a }
    func str(tabIndent: Int,
             usesTabs: Bool) -> Str {
        
        interface.str + wrap(statements,
                             usesTabs:usesTabs,
                             tabIndent:tabIndent)
    }
    
    //MARK: -
    
    
    /// "{ self.a = a \n self.b = b \n }"
    func makeInitBody(_ args: [Arg],
                      tabIndent: Int,
                      usesTabs: Bool) -> Str {
        
        wrap(args.map { $0.selfInitStr },
             usesTabs:usesTabs,
             tabIndent:tabIndent)
    }
    
    func makeInitBody(_ args: [FuncArg],
                      tabIndent: Int,
                      usesTabs: Bool) -> Str {
        
        makeInitBody(args.args,
                     tabIndent: tabIndent,
                     usesTabs: usesTabs)
    }
}


/// if optional is true - makes
/// makes full init func decl
//    func makeInitDecl(_ args: [FuncArg],
//                      optional: Bool,
//
//                      tabIndent: Int,
//                      usesTabs: Bool) -> Str {
//
//        let interface = InitInterface(args: args,
//                                      optional: optional)
//
//        //TODO: consider passing arg - withWordFunc
//        // only for this case ??
//
//        // init(cat: Cat)
//        // let interface = makeFuncInterface(name: "init",args: args, returnType: nil, access: nil)
//
//        // self.cat = cat \n self.dog = dog
//        let body = FuncDecl(interface:interface,
//                            statements: args.map { $0.selfInitStr })
//        let bodyStr = body.str(tabIndent: tabIndent,
//                               usesTabs: usesTabs)
//        return interface + wrapIntoBody(body,
//                                        tabIndent: tabIndent,
//                                        usesTabs: usesTabs)
//    }
