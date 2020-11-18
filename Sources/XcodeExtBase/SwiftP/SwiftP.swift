
@_exported import Base


/// any Swift identifier
public protocol SwiftP {} //HasStrP
public extension SwiftP {
    
    //MARK: - stateless utils
    
    // not static - for conv-nce
    
    //TODO: try remove and use lines interface only
    /// "{ \n\(indent)\(str)}\n }"
    //    func wrapIntoBody(line: Str,
    //                      usesTabs: Bool = false,
    //                      tabIndent: Int = 4) -> Str {
    //
    //        let indent = _indent(usesTabs: usesTabs,
    //                             tabIndent: tabIndent)
    //        return "{\n\n\(indent)\(line)\n}"
    //    }
    
    /// Wraps lines with {} - to use in func, or inside a type decl
    /// "{ lines.map{indent + $0}.joined(separator: "\n") }"
    func wrap(_ str: Str,
              usesTabs: Bool = false,
              tabIndent: Int = 4) -> Str {
        "{\n\n" + str + "\n}"
    }
    
    /// Wraps lines with {} - to use in func, or inside a type decl
    /// "{ lines.map{indent + $0}.joined(separator: "\n") }"
    func wrap(_ lines: [Str],
              usesTabs: Bool = false,
              tabIndent: Int = 4) -> Str {
        
        "{\n\n" + prefix(lines,
                         withIndent: tabIndent,
                         usesTabs: usesTabs) + "\n}"
    }
    
    /// Prefixes each line with indent
    /// "{ lines.map{indent + $0}.joined(separator: "\n") }"
    func prefix(_ lines: [Str],
                withIndent indent: Str) -> Str {
        
        lines.map{indent + $0}.joined(separator: "\n")
    }
    
    /// Prefixes each line with 1 tab indent
    /// "{ lines.map{indent + $0}.joined(separator: "\n") }"
    func prefix(_ lines: [Str],
                withIndent tabIndent: Int = 4,
                usesTabs: Bool = false) -> Str {
        prefix(lines, withIndent: _indent(usesTabs: usesTabs,
                                          tabIndent: tabIndent))
    }
    
    
    //MARK: - utils
    
    /// makes indentation Str of given width
    func _indent(usesTabs: Bool,
                 tabIndent: Int) -> Str {
        usesTabs ? "\t" : Str(repeating: " ", count: tabIndent)
    }
    
    //TODO: consider adding more funcs and rename to preprocess
//    /// trims spaces, tabs and newlines
//    func trim(_ line: Str) -> Str? {
//        Self.trim(line)
//    }
//
//    /// trims spaces, tabs and newlines, and removes empty lines
//    func trim(_ lines: [Str]) -> [Str]? {
//        Self.trim(lines)
//    }
//
//    /// trims spaces, tabs and newlines
//    static func trim(_ line: Str) -> Str? {
//        line.trimmingSpacesAndNewlines.sth
//    }
//
//    /// trims spaces, tabs and newlines, and removes empty lines
//    static func trim(_ lines: [Str]) -> [Str]? {
//        lines.map{trim($0)}.compactMap{$0}.sth
//    }
}


public typealias SwiftT = SwiftP & Hashable




extension Array where Element == Str {
    /// map { $0.trimmingSpacesAndNewlines }.compactMap{$0}.sth
    var trim: Array? {
        map { $0.trimmingSpacesAndNewlines }.compactMap{$0}.sth
    }
}

extension Str {
    /// trimmingSpacesAndNewlines
    var trim: Str {
        trimmingSpacesAndNewlines
    }
}
