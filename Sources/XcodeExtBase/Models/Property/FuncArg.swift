

/// _ str1: Str?
public struct FuncArg: SwiftT {
    
    /// "cat: Cat"
    public var arg: Arg
    
    /// "_ cat: Cat"
    public var hasDash: Bool
    
    //TODO:
    // try add defaultValue -> "_ str1: Str? = nil"
    // at least nil, and true/false for Bool
}
public extension FuncArg {
    
    init(_ arg: Arg,
         hasDash: Bool = false) {
        self.arg = arg
        self.hasDash = hasDash
    }
    
    init(name: Str,
         _ type: TypeName,
         hasDash: Bool = false) {
        self.init(Arg(name: name, type),
                  hasDash: hasDash)
    }
    
    init(name: Str, type: Str,
         hasDash: Bool = false,
         optional: Bool = false) {
        self.init(Arg(name: name, TypeName(type, optional: optional)),
                  hasDash: hasDash)
    }
    
    
    //MARK: -
    
    /// "cat: Cat?" - cat
    var name: Str {
        get {
            arg.name
        }
        set {
            arg.name = newValue
        }
    }
    
    /// "cat: Cat?" - Cat?
    var type: TypeName {
        get {
            arg.type
        }
        set {
            arg.type = newValue
        }
    }
    
    /// "cat: Cat?" - Cat?
    var typeStr: Str {
        get {
            type.type
        }
        set {
            type.type = newValue
        }
    }
    
    var optional: Bool {
        get {
            arg.optional
        }
        set {
            arg.optional = newValue
        }
    }
    
    
    //MARK: -
    
    /// "_ cat: Cat"
    var argStr: Str {
        (hasDash ? "_ " : "") + name + ": " + type.str
    }
    
    /// "cat = Cat"
    var selfInitStr: Str {
        "self.\(name) = \(name)"
    }
}


extension Array where Element == FuncArg {
    
    var args: [Arg] {
        map{$0.arg}
    }
}
