


/// "cat: Cat"
public struct Arg: SwiftT {
    
    /// "cat: Cat" - cat
    public var name: Str
    
    //TODO:
    // impl enum DataType and add default value logic
    // common data types
    
    /// "cat: Cat" - Cat
    public var type: TypeName
    
    
    //TODO: try add default arg
}
public extension Arg {
    
    /// str: Str?
    init(name: Str,
         _ type: TypeName) {
        self.name = name
        self.type = type
    }
    
    /// str: Str?
    init(name: Str,
         type: Str,
         optional: Bool = false,
         _static: Bool = false) {
        self.init(name: name,
                  TypeName(type, optional:optional))
    }
    
    //MARK: -
    
    var optional: Bool {
        get {
            type.optional
        }
        set {
            type.optional = newValue
        }
    }
    
    var typeStr: Str {
        get {
            type.type
        }
        set {
            type.type = newValue
        }
    }
    
    //MARK: -
    
    /// "cat: Cat"
    var argStr: Str {
        name + ": " + type.str
    }
    /// "cat = Cat"
    var selfInitStr: Str {
        "self.\(name) = \(name)"
    }
    
    /// used by protocol - to add "var property name: Type {get set}"
    func protocolStr(withSetter: Bool = false,
                     usesTabs: Bool = false,
                     tabIndent: Int = 4) -> Str {
        
        "var " + (withSetter ? " {get}" : " {get set}")
    }
}

public extension Array where Element == Arg {
    
    func funcArgs(hasDash: Bool = false) -> [FuncArg] {
        map{ FuncArg($0, hasDash: false) }
    }
}
