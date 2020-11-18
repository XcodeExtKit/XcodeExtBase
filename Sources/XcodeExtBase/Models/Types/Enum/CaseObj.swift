

/// enum case which can be repr-d in 3 ways: rawValue, nested value or just case
/// Supported formats: case cat, case cat = "", case .cat(Animal),
public struct CaseObj: SwiftT {
    
    /// case name
    public var name: Str
    
    
    //MARK: - internal
    
    //TODO: try replace with type enum (allowing custom type! )
    enum CaseValue: Hashable {
        case rawValue(Str) // usually Str
        case nestedType(TypeName) // can be any clas, struct, etc
    }
    
    /// nil if nested type and value are absent
    var value: CaseValue?
    
    init(name: Str,
         value: CaseValue?) {
        self.name = name
        self.value = value
    }
}
public extension CaseObj {
    
    /// if rawValue is nil - make case without rawvalue
    init(name: Str,
         rawValue: Str? = nil) {
        
        var val: CaseValue?
        if let a = rawValue {
            val = .rawValue(a)
        } else {
            val = nil
        }
        self.init(name: name, value: val)
    }
    
    init(name: Str,
         _ nestedType: TypeName) {
        self.init(name: name,
                  value: .nestedType(nestedType))
    }
    
    init(name: Str,
         nestedType: Str,
         optional: Bool = false) {
        self.init(name: name,
                  TypeName(nestedType, optional: optional))
    }
    
    
    //MARK: -
    
    // if nil is set - makes case without stored value
    var rawValue: Str? {
        get {
            switch value {
            case .rawValue(let a):
                return a
            default:
                return nil
            }
        }
        set {
            if let a = newValue {
                value = .rawValue(a)
            } else {
                value = nil
            }
        }
    }
    
    // if nil is set - makes case without stored value or type
    var nestedType: TypeName? {
        get {
            switch value {
            case .nestedType(let a):
                return a
            default:
                return nil
            }
        }
        set {
            if let a = newValue {
                value = .nestedType(a)
            } else {
                value = nil
            }
        }
    }
    
    var hasRawValue: Bool {
        rawValue != nil
    }
    var hasNestedType: Bool {
        nestedType != nil
    }
    
    // String can be in 3 forms
    // - type decl - case cat(Cat), case cat
    // - for switch statement: case .cat(let a), .case .cat
    
    // can use for mixed enums
    /// case .cat(let a), .case .cat
    var switchStr: Str {
        var r = "case ." + name
        if let _ = nestedType {
            r += "(let a)"
        }
        return r + ":"
    }
    
    /// case cat(Cat), case cat
    var typeDeclStr: Str {
        var r = "case " + name
        if let type = nestedType {
            r += " (\(type.type))" + (type.optional ? "?" : "")
        } else if let val = rawValue {
            r += " = \(val)"
        }
        return r
    }
    
    /// case cat(Cat), case cat
    var str: Str {
        typeDeclStr
    }
}


//enum Example_CaseObj {
//
//    case a(Str)
//    case b(Int)
//}


/// enum case with raw value, may be absent
//struct RawCase { //EnumRawCase
//
//    var name: Str
//
//    var value: Str?
//}


//enum Example_RawCase: Str {
//
//    case a = "aaa"
//    case b = "bbb"
//}

//add = "" to all selected cases
//remove = "" (rawvalue) from cases
