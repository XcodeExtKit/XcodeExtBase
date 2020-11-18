


public protocol CanBeStaticP {
    
    var _static: Bool {get set}
}
public extension CanBeStaticP {
    
    /// _static ? "static" : ""
    var staticStr: Str {
        _static ? "static" : ""
    }
}



//// can be used in child classes only
//public protocol CanBeOverridingP {
//
//    var overriding: Bool {get set}
//}
//public extension CanBeOverridingP {
//
//    /// (_overriding ? "override" : "")
//    var overridingStr: Str {
//        (overriding ? "override" : "")
//    }
//}
