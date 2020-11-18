

public protocol HasFuncsP: SwiftP {
    
    var funcs: [FuncDecl] {get}
}

public extension HasFuncsP {
    
    /// makes a list of props, separated by 2 newlines and prefixed with indent
    func str(with funcDecls: [FuncDecl],
             usesTabs: Bool = false,
             tabIndent: Int = 4) -> Str {
        
        funcDecls.map {
            $0.str(usesTabs:usesTabs,
                   tabIndent:tabIndent)
        }.joined(separator: "\n\n")
    }
}
