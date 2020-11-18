


/// (public) var cat: Cat
public struct Property: SwiftT, CanBeStaticP, HasAccessModP { //InitsWithStr_P
    
    public var arg: Arg
    
    public var access: AccessMod?
    
    //TODO: also storing option - to make it with internal stored property
    
    /// if false it's computed
    public var varType: VarType
    
    public var _static: Bool
    
    //TODO: ?
    // can be used in child classes only
    // public var overriding: Bool
}

public extension Property {
    
    init(_ arg: Arg,
         _ varType: VarType,
         _static: Bool = false,
         _ access: AccessMod? = nil) {
        
        self.arg = arg
        self.varType = varType
        self.access = access
        self._static = _static
    }
    
    /// public static var str: Str?
    init(name: Str, type: Str,
         _ varType: VarType,
         optional: Bool = false,
         _static: Bool = false,
         _ access: AccessMod? = nil) {
        
        self.init( Arg(name: name, type: type,
                       optional: optional),
                   varType, _static: _static, access)
    }
    
    
    //MARK: -
    
    /// (public) var cat: Cat
    var str: Str {
        //TODO: computed with body
        accessStr + "var" + arg.argStr
    }
    
    /// produces computed property with format
    /// { get {...} \n set {...} }
    func computedStr(getterStatements: [Str],
                     setterStatements: [Str]) -> Str? {
        
        guard getterStatements.hasSth else {
            return nil
        }
        
        //TODO: varType -> let/var
        let interface = accessStr + staticStr + "var" + arg.argStr
        
        //TODO: if short - make one liner?
        if setterStatements.hasSth {
            let getStr = "get {\n \(getterStatements.joinedLines) \n}"
            let setStr = "set {\n \(setterStatements.joinedLines) \n}"
            return interface + "{\n" + getStr + "\n" + setStr + "\n}"
        }
        return interface + "{\n \(setterStatements.joinedLines) \n}"
    }
    
    
    /// generates empty block for this Str
    //    var computedStr: Str {
    //        fatalError()
    //        //accessStr + "var" + arg.argStr
    //    }
}

