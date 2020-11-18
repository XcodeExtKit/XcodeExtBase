

/// Any type decl, except protocol
/// (public) struct Cat { var name: Str}
public struct ClassDecl: TypeDeclP { 
    
    //TODO: consider separating into TypeInterface (name and type) and body ??

    /// type name
    public var name: Str
    
    
    public var props: [Property]
    
    //TODO: add funcs, init
    
    public var funcs: [FuncDecl]
    
    public var inits: [InitDecl]
    
    public var access: AccessMod?

    //HasExtsP
    public var exts: [ExtDecl]
}

public extension ClassDecl {
    
    init(name: Str,
         props: [Property] = [],
         funcs: [FuncDecl] = [],
         inits: [InitDecl] = [],
         exts: [ExtDecl] = [],
         _ access: AccessMod? = nil) {
        
        self.name = name
        self.props = props
        self.access = access
        self.funcs = funcs
        self.inits = inits
        self.exts = exts
    }
    
    
    /// (public) struct Cat { var name: Str}
    func str(usesTabs: Bool = false,
             tabIndent: Int = 4) -> Str {
        
        //TODO: make and use common func in TypeDeclP
        let propsStr = wrap(props.map{$0.str},
                            usesTabs:usesTabs,
                            tabIndent:tabIndent)
        
        //        let funcsStr = wrap(funcs.map{$0.str},
        //                            usesTabs:usesTabs,
        //                            tabIndent:tabIndent)
        
        //        let initStr = wrap(inits.map{$0.str},
        //                            usesTabs:usesTabs,
        //                            tabIndent:tabIndent)
        var r = "сlass" + name + propsStr
        if let a = access {
            r = r + a.str
        }
        return r
    }
    
    //TODO: typeID convs - isClas, etc
}

