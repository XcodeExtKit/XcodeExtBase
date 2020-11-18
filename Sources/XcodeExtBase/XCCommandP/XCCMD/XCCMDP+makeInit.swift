


public extension XCCMDP {
    
    //consider returning lines, without newlines ?
    
    
    //MARK: - init
    
    /// if optional is true - makes
    /// makes full init func decl
    func makeInitDecl(_ args: [Arg],
                      optional: Bool,
                      usesTabs: Bool = false,
                      tabIndent: Int = 4) -> Str {
        
        let interface = makeInitInterface(args, optional: optional)
        
        //TODO: consider passing arg - withWordFunc
        // only for this case ??
        
        // init(cat: Cat)
        // let interface = makeFuncInterface(name: "init",args: args, returnType: nil, access: nil)
        
        // self.cat = cat \n self.dog = dog
//        let body = makeFuncBody(statements: args.map { $0.selfInitStr },
//                                usesTabs:usesTabs,
//                                tabIndent:tabIndent)
//        return interface + " " + body
        
        return makeFuncDecl(interface: interface,
                            statements: args.map { $0.selfInitStr })
    }
    
    /// if optional is true - makes
    func makeInitInterface(_ int: InitInterface) -> Str {
        var r = "init"
        if int.optional {
            r += "?"
        }
        let argStr = int.args.map{$0.argStr}.joined(separator: ", ")
        r += "(\(argStr))"
        if let mod = int.access {
            r += mod.s
        }
        return r
    }
    
    //TODO: default args (at least Bool, optionals)
    /// if optional is true - makes
    func makeInitInterface(_ args: [FuncArg],
                           access: AccessMod? = nil,
                           optional: Bool = false) -> Str {
        makeInitInterface(.init(args: args,
                                optional: optional,
                                access))
    }
    
    //TODO: hasDash, default args (at least Bool, optionals)
    /// if optional is true - makes
    func makeInitInterface(_ args: [Arg],
                           access: AccessMod? = nil,
                           optional: Bool = false) -> Str {
        makeInitInterface(.init(args: args.map{FuncArg($0, hasDash:false)},
                                optional: optional,
                                access))
    }
    
    /// "{ self.a = a \n self.b = b \n }"
    func makeInitBody(_ args: [Arg],
                      usesTabs: Bool = false,
                      tabIndent: Int = 4) -> Str {
        
        makeFuncBody(statements: args.map { $0.selfInitStr },
                     usesTabs:usesTabs,
                     tabIndent:tabIndent)
    }
}
