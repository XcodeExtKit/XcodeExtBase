

public extension ProtocolDecl {
    
    /// Makes full protocol declaration
    /// (public) protocol CatP
    /// properties, format: { var name: Str {get set} }
    /// funcs, inits, extensions
    func str(usesTabs: Bool = false,
             tabIndent: Int = 4) -> Str {
        
        fatalError()
        
        //TODO: make and use common func in TypeDeclP
        // let propStr = propertyStr
        // let funcsStr = funcInterfaceStr
        // let initStr = initInterfaceStr
        
        // var r = "protocol " + name + propsStr
        // if let a = access {
        //    r = r + a.str
        // }
        // return r
    }
    
    
    /// makes a list of protocol initializer declarations with , separated by 2 newlines and prefixed with indent
    /// only to use in protocols
    func initInterfaceStr(_ interfaces: [InitInterface],
                          usesTabs: Bool = false,
                          tabIndent: Int = 4) -> Str {
        
        interfaces.map {
            _indent(usesTabs: usesTabs,
                    tabIndent: tabIndent) + $0.str
        }.joined(separator: "\n\n")
    }
    
    
    /// makes a list of protocol function declarations with , separated by 2 newlines and prefixed with indent
    /// only to use in protocols
    func funcInterfaceStr(_ interfaces: [FuncInterface],
                          usesTabs: Bool = false,
                          tabIndent: Int = 4) -> Str {
        
        interfaces.map {
            _indent(usesTabs: usesTabs,
                    tabIndent: tabIndent) + $0.str
        }.joined(separator: "\n\n")
    }
    
    
    /// makes a list of protocol property declarations with { get (set) }
    /// separated by 2 newlines and prefixed with indent
    /// used by protocol - to add "var property name: Type {get set}"
    func propertyStr(_ properties: [Arg],
                     withSetters: Bool = false,
                     usesTabs: Bool = false,
                     tabIndent: Int = 4) -> Str {
        properties.map {
            $0.protocolStr(withSetter: withSetters,
                           usesTabs: usesTabs,
                           tabIndent: tabIndent)
        }.joined(separator: "\n\n")
    }
}






