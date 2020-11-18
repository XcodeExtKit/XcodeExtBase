


public struct Comment: SwiftT, HasDescrP {
    
    /// without newlines
    public var lines: [Str]
    
    public var style: Style
}

public extension Comment {
    
    enum Style: Str, StrEnumT {
        case multiline
        case doubleSlash
        case tripleSlash
    }
    
    
    init(_ lines: [Str],
         _ style: Style) {
        self.lines = lines
        self.style = style
    }
    
    init(_ line: Str,
         _ style: Style) {
        self.init([line], style)
    }
    
    
    //MARK: -
    
    /// can make 3 types of comments - //, /// and /** */
    /// returns indented lines
    func str(usesTabs: Bool = false,
             tabIndent: Int = 4) -> Str? {
        
        guard let strs = lines.trim else {
            return nil
        }
        
        var prefixStr = _indent(usesTabs: usesTabs,
                                tabIndent: tabIndent)
        switch style {
        case .multiline:
            return "/* " + strs.joinedLines + " */"
        case .doubleSlash:
            prefixStr += "// "
        case .tripleSlash:
            prefixStr += "/// "
        }
        return prefix(strs,
                      withIndent: tabIndent,
                      usesTabs: usesTabs)
    }
    
    var descr: Str {
        "Comment, \(style): \(lines.joinedLines)"
    }
}
