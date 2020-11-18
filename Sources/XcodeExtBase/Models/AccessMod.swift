

public enum AccessMod: Str, StrEnumT {
    
    case _private = "private"
    case _fileprivate = "fileprivate"
    case _public = "public"
    case _internal = "internal"
    
    case _open = "open" // class only
}

public extension AccessMod {
 
    /// returns a String without prepended AccessMod (if it's present)
    /// and the mod which was found
    static func extractMod(_ line: Str) -> (Str, AccessMod)? {
        
        //try use parseLine
        fatalError()
        
//        let str = line.trimmingSpacesAndNewlines
//
//        guard let mod = allCases.first(where: { caseStr in
//            str.hasPrefix(caseStr)
//        }) else {
//            return nil
//        }
//        let restStr = str.removing(prefix: mod.s)!
//        return (restStr, mod)
    }
    
    
//    /// tries to find first match only at the start of the String
//    static func parseMod(_ line: Str) -> AccessMod? {
//
//        allCases.contains(where: { str in
//            str.hasPrefix
//        })
//        //if
//    }
//
//    /// tries to find first match only at the start of the String
//    static func indexAfterFirstMod(_ line: Str) -> AccessMod? {
//
//        allCases.contains(where: { str in
//            str.hasPrefix
//        })
//        //if
//    }
}


//MARK: -

public protocol HasAccessModP {
    
    var access: AccessMod? {get}
}

public extension HasAccessModP {
    
    /// access?.str ?? ""
    var accessStr: Str {
        access?.str ?? ""
    }
}
