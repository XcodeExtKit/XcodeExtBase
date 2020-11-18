



public protocol HasInitsP: SwiftP {
    
    var inits: [InitDecl] {get}
}

public extension HasInitsP {
    
    /// makes a list of props, separated by 2 newlines and prefixed with indent
    func str(with initDecls: [InitDecl],
             usesTabs: Bool = false,
             tabIndent: Int = 4) -> Str {
        
        initDecls.map {
            $0.str(tabIndent:tabIndent,
                   usesTabs:usesTabs)
        }.joined(separator: "\n\n")
    }
}
