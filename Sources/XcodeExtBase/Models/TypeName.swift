

//TODO:
// impl enum DataType with common data types
// add default value logic


/// any type name, for ex "Str?"
public struct TypeName: SwiftT {
    
    /// String, Int, etc
    public var type: Str
    
    public var optional: Bool
}
public extension TypeName {
    
    init(_ type: Str,
         optional: Bool = false) {
        self.type = type
        self.optional = optional
    }
    
    /// "Str?"
    var str: Str {
        type + (optional ? "?" : "")
    }
}
