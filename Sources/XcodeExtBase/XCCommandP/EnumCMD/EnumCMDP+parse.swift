

public extension EnumCMDP {
    
    func parseCaseObjs(from lines: [Str]) -> [CaseObj]? {
        
        fatalError()
        //TODO:
        //        let caseStr = "case"
        //
        //        var lineStrs = lines.map {
        //            $0.trimmingSpaces
        //        }.filter {
        //            $0.hasPrefix(caseStr)
        //        }
        //
        //        // case cat, dog, etc
        //        guard lineStrs.hasSth else {
        //            return nil
        //        }
        //
        //        // remove "case" from "case cat, dog"
        //        lineStrs = lineStrs.map { line in
        //
        //            //TODO: test
        //            line.lastSuffix(after: caseStr)
        //            //was
        //            //            let idx = line.index(line.startIndex,
        //            //                                 offsetBy: caseStr.count)
        //            //            return line.suffix(from: idx)
        //        }
        //
        //        var r = [Str]()
        //        lineStrs.forEach { caseList in
        //
        //            //  cat, dog, etc
        //            let cases = caseList.components(separatedBy: ",").map {
        //                getCaseName(fromCaseLine: $0)
        //            }
        //
        //            let cleanedCases = cases.map {
        //                $0.trimmingSpaces
        //            }.filter {
        //                $0.hasLettersANDNumbers && $0.first!.isLetter
        //            }
        //
        //            // cat dog etc
        //            r += cleanedCases
        //        }
        //        return r.sth
    }
    
    //MARK: - parseCases
    
    func parseCases(from line: Str) -> [Str]? {
        /// format 1: case cat, dog, etc
        /// format 2: case cat \n case dog \n etc - todo !
        /// all invalid cases (for ex starting with number) are filtered out
        fatalError()
    }
    
    /// Each line can have 2 of the following formats, no newLines
    /// format 1: case cat, dog, etc
    /// format 2: case cat \n case dog \n etc - todo !
    /// all invalid cases (for ex starting with number) are filtered out
    func parseCases(from lines: [Str]) -> [Str]? {
        
        let caseStr = "case"
        
        var lineStrs = lines.map {
            $0.trimmingSpaces
        }.filter {
            $0.hasPrefix(caseStr)
        }
        
        // case cat, dog, etc
        guard lineStrs.hasSth else {
            return nil
        }
        
        // remove "case" from "case cat, dog"
        lineStrs = lineStrs.map { line in
            
            //TODO: test
            line.lastSuffix(after: caseStr)
            //was
            //            let idx = line.index(line.startIndex,
            //                                 offsetBy: caseStr.count)
            //            return line.suffix(from: idx)
        }
        
        var r = [Str]()
        lineStrs.forEach { caseList in
            
            //  cat, dog, etc
            let cases = caseList.components(separatedBy: ",").map {
                getCaseName(fromCaseLine: $0)
            }.compactMap{$0}
            
            let cleanedCases = cases.map {
                $0.trimmingSpaces
            }.filter {
                $0.hasLettersANDNumbers && $0.first!.isLetter
            }
            
            // cat dog etc
            r += cleanedCases
        }
        return r.sth
    }
    
    
    //MARK: -
    
    /// case cat(Cat)
    func getNestedType(fromCaseLine caseLine: Str) -> Str? {
        
        // case cat | = "fasdsa"
        // in case of a raw value
        guard !caseLine.contains("="),
              caseLine.contains(["(", ")"]) else {
            return nil
        }
        
        // case cat(Cat | ) // furry animal
        let beforeBracket = caseLine.firstPrefix(before: ")")
        
        // case cat( | Cat
        // in case of a nested value
        let afterBracket = beforeBracket.lastSuffix(after: "(")
        
        return afterBracket
    }
    
    /// case cat = "cat"
    func getRawValue(fromCaseLine caseLine: Str) -> Str? {
        
        guard caseLine.len > 4,
              caseLine.last! == "\"",
              caseLine.contains("=") else {
            return nil
        }
        // case cat | = "fasdsa"
        let beforeQuote = caseLine.removingLast!
        let afterQuote = beforeQuote.lastSuffix(after: "\"")
        
        return afterQuote
    }
    
    
    /// Strips all unnecessary Strings - to get case name
    /// case cat(Cat) = "fasdsa" -> cat
    func getCaseName(fromCaseLine caseLine: Str) -> Str? {
        getCaseNames(fromCaseLine: caseLine)?.first
        //        // case cat | = "fasdsa"
        //        // in case of a raw value
        //        let beforeEquality = caseLine.firstPrefix(before: "=")
        //
        //        // case cat | (Cat)
        //        // in case of an nested value
        //        let beforeBracket = beforeEquality.firstPrefix(before: "(")
        //
        //        // case cat | // furry animal
        //        let beforeComments = beforeBracket.firstPrefix(before: "//")
        //
        //        return beforeComments
    }
    
    /// case cat, dog, etc
    func getCaseNames(fromCaseLine caseLine: Str) -> [Str]? {
        
        // has rawValue
        if caseLine.contains("=") {
            
            // case cat | = "fasdsa"
            // in case of a raw value
            let beforeEquality = caseLine.firstPrefix(before: "=")
            
            // case cat | // furry animal
            let beforeComments = beforeEquality.firstPrefix(before: "//")
            
            return [beforeComments]
            
            // has nested value
        } else if caseLine.contains("("),
                  caseLine.contains(")")  {
            
            // case cat | (Cat)
            // in case of an nested value
            let beforeBracket = caseLine.firstPrefix(before: "(")
            
            // case cat | // furry animal
            let beforeComments = beforeBracket.firstPrefix(before: "//")
            
            return [beforeComments]
        }
        
        // otherwise can be many
        
        // case cat | // furry animal
        let beforeComments = caseLine.firstPrefix(before: "//")
        
        return beforeComments.split(by: ",")?.trim
    }
}
