

/// base for all commands processing class, struct or enum declarations
public protocol TypeCMDP: XCCMDP {}


public extension TypeCMDP {
    
    // conv
    func parseTypeFromSelection(in buffer: XCBufferP) -> TypeDeclP? {
        
        //TODO:
        // - improve to get also stored value
        // use CaseObj model - case name, type
        // - try support both formats - lines and list
        
//        guard let lines = buffer.selectedLines else {
//            return nil
//        }
//        return parseType(lines)
        fatalError()
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



// ???
///// base for all commands processing property lists
//public protocol PropertyCMDP: XCCMDP {}
//
//extension PropertyCMDP {
//
//    func parseProperty(_ str: Str) -> Property? {
//        fatalError()
//    }
//
//    func genProperty(_ prop: Property,
//                     usesTabs: Bool,
//                     tabWidth: Int) -> Str {
//        fatalError()
//    }
//}
