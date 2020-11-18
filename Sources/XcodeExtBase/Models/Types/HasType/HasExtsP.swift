


public protocol HasExtsP: SwiftP {
    
    var exts: [ExtDecl] {get}
}

public extension HasExtsP {
    
    /// makes a list of props, separated by 2 newlines and prefixed with indent
    func str(with exts: [ExtDecl],
             usesTabs: Bool = false,
             tabIndent: Int = 4) -> Str {
     
        exts.map {
            $0.str(usesTabs:usesTabs,
                   tabIndent:tabIndent)
        }.joined(separator: "\n\n")
    }
}
