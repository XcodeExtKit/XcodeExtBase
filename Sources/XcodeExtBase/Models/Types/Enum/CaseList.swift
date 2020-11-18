


//TODO: consider adding more options

/// enum case list, can have diff formats
/// case cat, dog, etc or each case on diff line, or several lines with groups of cases
public struct CaseList: SwiftT {
    
    //TODO: consider using Set
    /// each case can have format "case .cat(Animal)"
    public var cases: [CaseObj]
    
    
    // cases can be combined in lines (use numLines)
    // or separated into one case per
    //    enum Format: Hashable {
    //
    //        // max lines - one case per line
    //        case numLines(Int)
    //
    //        case maxLines
    //    }
    // var format: Format
    
    /// use Int.max to put each case on diff line
    public var numLines: Int
}
public extension CaseList {
    
    /// numLines - use Int.max to put each case on diff line
    init(_ cases: [CaseObj],
         numLines: Int) {
        self.cases = cases
        self.numLines = numLines
    }
    
    
    //    init(_ cases: [CaseObj],
    //         _ format: Format) {
    //        self.cases = cases
    //        self.format = format
    //    }
    
    //MARK: -
    
    static func oneLine(_ cases: [CaseObj]) -> CaseList {
        .init(cases, numLines: 1)
    }
    static func maxLines(_ cases: [CaseObj]) -> CaseList {
        .init(cases, numLines: Int.max)
    }
    
    static func oneLine(_ cases: [Str]) -> CaseList {
        oneLine( cases.map{ CaseObj(name: $0) })
    }
    static func maxLines(_ cases: [Str]) -> CaseList {
        oneLine( cases.map{ CaseObj(name: $0) })
    }
    
    
    //MARK: -
    
    var str: Str {
        switch numLines {
        case 1:
            return cases.map{"case " + $0.str}.joined(separator: ",")
        case Int.max:
            return cases.map{"case " + $0.str}.joined(separator: "\n")
        default:
            let lines = cases.chunked(into: numLines)
            return lines.map{$0.makeLine()}.joined(separator: "\n")
        }
    }
    
    /// case cat, dog, etc
    func makeLine(with cases: [CaseObj]) -> Str {
        cases.makeLine()
    }
    
    
    // ??
    //    /// CaseObjs with nested value cannot be used with one line
    //    var isValid: Bool {
    //        //fatalError()
    //        switch numLines {
    //        case 1:
    //            return !cases.contains{$0.hasNestedType}
    //        case Int.max:
    //            return true
    //        default:
    //// let lines = cases.chunked(into: numLines)
    //// return lines.map{$0.makeLine()}.joined(separator: "\n")
    //        }
    //    }
}


extension Array where Element == CaseObj {
    /// case cat, dog, etc
    func makeLine() -> Str {
        "case " + map{$0.str}.joined(separator: ", ")
    }
}

