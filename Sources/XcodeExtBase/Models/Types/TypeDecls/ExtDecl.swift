

public protocol ExtDeclP: AnyTypeDeclP, HasPropsP, HasFuncsP, HasInitsP {}

//public typealias ExtDeclT = ExtDeclP & Hashable


/// Any type decl, except protocol
/// (public) struct Cat { var name: Str}
public struct ExtDecl: ExtDeclP { 
    
    //TODO: consider separating into TypeInterface (name and type) and body ??

    /// type name
    public var name: Str
    
    
    public var props: [Property]
    
    //TODO: add funcs, init
    
    public var funcs: [FuncDecl]
    
    public var inits: [InitDecl]
    
    public var access: AccessMod?
}

public extension ExtDecl {
    
    init(name: Str,
         props: [Property] = [],
         funcs: [FuncDecl] = [],
         inits: [InitDecl] = [],
         _ access: AccessMod? = nil) {
        
        self.name = name
        self.props = props
        self.access = access
        self.funcs = funcs
        self.inits = inits
    }
    
    
    /// (public) struct Cat { var name: Str}
    func str(usesTabs: Bool = false,
             tabIndent: Int = 4) -> Str {
        
        //TODO: make and use common func in TypeDeclP
        //let propsStr = wrap(props.map{$0.str})
        
        //        let funcsStr = wrap(funcs.map{$0.str},
        //                            usesTabs:usesTabs,
        //                            tabIndent:tabIndent)
        
        //        let initStr = wrap(inits.map{$0.str},
        //                            usesTabs:usesTabs,
        //                            tabIndent:tabIndent)
        
//        let body = wrap(statements,
//                        usesTabs:usesTabs,
//                        tabIndent:tabIndent)
        
        var r = "extension " + name //+ propsStr
        if let a = access {
            r = r + a.str
        }
        return r
    }
    
    //TODO: typeID convs - isClas, etc
}

