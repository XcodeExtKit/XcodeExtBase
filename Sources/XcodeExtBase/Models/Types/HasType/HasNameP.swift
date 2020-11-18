


public protocol HasNameP: SwiftP {
 
    var name: Str {get}
}

public extension HasNameP {
    
    /// type decl, for ex struct Cat
    func str(with name: Str,
             type: SwiftType? = nil) -> Str {
        
        name + " " + (type?.str ?? "")
    }
}
