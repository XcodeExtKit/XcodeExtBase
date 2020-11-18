


public extension XCCMDP {
    
    //TODO: consider impl model FuncStatement
    
    /// interface + statements.joined("\n") -> wrapInto {}
    func makeFuncDecl(interface: Str,
                      statements: [Str],
                      
                      usesTabs: Bool = false,
                      tabIndent: Int = 4) -> Str {
        
        interface + " " + makeFuncBody(statements: statements,
                                       usesTabs: usesTabs,
                                       tabIndent: tabIndent)
    }
    
    /// "{ self.a = a \n callSomeFunc() \n }"
    func makeFuncBody(statements: [Str],
                      usesTabs: Bool = false,
                      tabIndent: Int = 4) -> Str {
        wrap(statements,
             usesTabs: usesTabs,
             tabIndent: tabIndent)
    }
    
    
    //MARK: - interface

    
    //TODO: try use to make protocols
    
    //TODO: hasDash, default args (at least Bool, optionals)
    
    /// func print(_ str1: Str?, _ str2: Str?) -> Str?
//    func makeFuncInterface(name: Str,
//                           args: [FuncArg] = [],
//                           returnType: TypeDeclP? = nil,
//                           _static: Bool = false,
//                           _ access: AccessMod? = nil) -> Str {
//        FuncInterface(name:name,
//                      args: args,
//                      returnType: returnType,
//                      _static: _static,
//                      access).str
//    }
    
    //TODO: hasDash, default args (at least Bool, optionals)
    /// func print(_ str1: Str?, _ str2: Str?) -> Str?
    func makeFuncInterface(name: Str,
                           args: [Arg],
                           returnType: TypeName? = nil,
                           _static: Bool = false,
                           argsHaveDash: Bool = false,
                           _ access: AccessMod? = nil) -> Str {
        
            FuncInterface(name:name,
                          args: args.funcArgs(hasDash: argsHaveDash),
                          returnType: returnType,
                          _static: _static, access).str
//        makeFuncInterface(name: name,
//                          args: args.map{ FuncArg($0, hasDash:false) },
//                          returnType: returnType,
//                          _static: _static,
//                          access)
    }
}
