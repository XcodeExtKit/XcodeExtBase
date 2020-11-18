

/// base for all commands processing enums
public protocol EnumCMDP: XCCMDP {}

public extension EnumCMDP {
    
    /// parses enum cases, and returns their names
    func parseCasesFromSelection(in buffer: XCBufferP) -> [Str]? {
        
        //TODO:
        // - improve to get also stored value
        // use CaseObj model - case name, type
        // - try support both formats - lines and list 
        
        guard let lines = buffer.selectedLines else {
            return nil
        }
        return parseCases(from: lines)
    }
    
    
    //MARK: - valid
    
    /// Enum case line can have the following format, no newLines
    /// case cat, dog, etc
    func isValid(caseLine: Str) -> Bool {
        caseLine.hasPrefix("case ") &&
            caseLine.wordCount > 1
        
        //TODO: 3 cases
        // - list of cases
        // isValid(caseList: caseLine.removing(prefix: "case ")! )
        // - case with rawValue - case cat = "cat"
        // - case with nested value - case cat(Cat)
    }
    
    /// Enum case line can have 2 of the following formats, no newLines
    /// format 1: cat, dog, etc
    /// format 2: cat \n case dog \n etc - todo !
    //    func isValid(caseList: Str) -> Bool {
    //
    //        //TODO:
    //        // check that no keywords used
    //        caseList.hasLettersANDNumbers && caseList.first!.isLetter
    //    }
}
