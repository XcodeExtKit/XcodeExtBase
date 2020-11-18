

//public protocol ProtocolDeclP: AnyTypeDeclP, HasInitInterfacesP, HasFuncInterfacesP {}
//public typealias ProtocolDeclT = ProtocolDeclP & SwiftT


/// (public) protocol CatP { var name: Str {get set} funcs inits } + extensions
public struct ProtocolDecl: AnyTypeDeclP { 
    
    /// type name
    public var name: Str
    
    //TODO:  to support get set for ech prop - need new model, but not now
    /// by default only getter is required "{get}"
    public var properties: [Arg]
    
    public var funcInterfaces: [FuncInterface]
    
    public var initInterfaces: [InitInterface]
    
    public var access: AccessMod?
    
    
    public var exts: [ExtDecl]
}

public extension ProtocolDecl {
    
    init(name: Str,
         properties: [Arg] = [],
         funcInterfaces: [FuncInterface] = [],
         initInterfaces: [InitInterface] = [],
         exts: [ExtDecl] = [],
         _ access: AccessMod? = nil) {
        
        self.name = name
        self.properties = properties
        self.funcInterfaces = funcInterfaces
        self.initInterfaces = initInterfaces
        self.access = access
        self.exts = exts
    }
 
    //TODO: typeID convs - isClas, etc
}
