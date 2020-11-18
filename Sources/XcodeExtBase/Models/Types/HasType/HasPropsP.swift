


public protocol HasPropsP: SwiftP { //HasArgsP ?
 
    var props: [Property] {get}
}

public extension HasPropsP {
    
    /// makes a list of props, separated by 2 newlines and prefixed with indent
    func str(with props: [Property],
             usesTabs: Bool = false,
             tabIndent: Int = 4) -> Str {
        
        props.map { $0.str }.joined(separator: "\n\n")
    }
}
