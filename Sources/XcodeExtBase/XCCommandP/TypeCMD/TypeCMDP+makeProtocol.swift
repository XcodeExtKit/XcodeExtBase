



public extension XCCMDP {
    
    /// (public) protocol CatP { var name: Str {get set} funcs inits } + extensions
    func makeProtocol(name: Str,
                      properties: [Arg] = [],
                      funcInterfaces: [FuncInterface] = [],
                      initInterfaces: [InitInterface] = [],
                      exts: [ExtDecl] = [],
                      access: AccessMod? = nil,
                      
                      usesTabs: Bool = false,
                      tabIndent: Int = 4) -> Str {
        
        ProtocolDecl
            .init(name: name,
                  properties: properties,
                  funcInterfaces: funcInterfaces,
                  initInterfaces: initInterfaces,
                  exts: exts, access)
            .str(usesTabs:usesTabs,
                 tabIndent:tabIndent)
    }
}
