
/// Struct, class, enum, extenson or protocol
public protocol AnyTypeDeclP: HasNameP, HasAccessModP {}


/// Struct, class, enum or extension
public protocol TypeDeclP: AnyTypeDeclP, HasExtsP, HasPropsP, HasFuncsP, HasInitsP {}


public extension TypeDeclP {
    
    /// (public) struct Cat { var name: Str}
    func str(with name: Str,
             accessMod: AccessMod? = nil,
             props: [Property] = [],
             funcs: [FuncDecl] = [],
             inits: [InitDecl] = [],
             
             usesTabs: Bool = false,
             tabIndent: Int = 4) -> Str {
        
        var r = bodyStr(with: props,
                        funcs: funcs,
                        inits: inits,
                        usesTabs:usesTabs,
                        tabIndent:tabIndent)
        
        r = name + " " + r
        if let a = access {
            r = a.str + " " + r
        }
        return r
    }
    
    /// wraps all statements into {\n\n \n}
    func bodyStr(with props: [Property] = [],
                 funcs: [FuncDecl] = [],
                 inits: [InitDecl] = [],
                 
                 usesTabs: Bool = false,
                 tabIndent: Int = 4) -> Str {
        
        var blocks = [Str]()
        
        let propStr = str(with: props,
                          usesTabs:usesTabs,
                          tabIndent:tabIndent)
        blocks.append(propStr)
        
        let funcStr = str(with: funcs,
                          usesTabs:usesTabs,
                          tabIndent:tabIndent)
        blocks.append(funcStr)
        
        let initStr = str(with: inits,
                          usesTabs:usesTabs,
                          tabIndent:tabIndent)
        blocks.append(initStr)
        
        //TODO: consider adding "MARK: - " betw each line
        return wrap(blocks.joined(separator: "\n\n"),
                    usesTabs:usesTabs,
                    tabIndent:tabIndent)
    }
}
