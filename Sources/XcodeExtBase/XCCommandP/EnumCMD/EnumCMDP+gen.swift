

public extension EnumCMDP {
    
    func generateSwitch(fromCases cases: [CaseObj]) {
        
        fatalError()
    }

    //TODO:
    // try improve by adding - gen with default "return nil" at the end - for cases when optional is needed
    // also try differentiate types of enums - can make Bool - true or false (2 cases: 1st is true, 2nd false, and vice verse)
    
    /// Generates a switch for an enum
    /// - if withStoredValue is true - inserts a word "return" after each case.
    /// Use this for returning some value for each case (not stored object)
    ///
    /// - if withStoredValue is false - inserts "(let a)" at each case, and word "return a" after each case.
    /// Use this for enums which have nested enums, and you can get a generic child object (probably using a common protocol for all of them)
    func generateSwitch(fromCases cases: [Str],
                        usesTabs: Bool,
                        tabWidth: Int,
                        withStoredValue: Bool) -> Str {
        
        let indent = _indent(usesTabs: usesTabs, tabIndent: tabWidth)
        let casesStr = cases.map {
            let start = "case .\($0)"
            if withStoredValue {
                // case .cat(let a): \n return
                return start + "(let a):\n\(indent)return a\n"
            }
            // case .cat: \n return
            return start + ":\n\(indent)return \n"
            
        }.joined()
        return "switch self {\n\(casesStr)}\n"
    }
}


//extension Str {
//
//    /// Enum case line can have the following format, no newLines
//    /// case cat, dog, etc
//    var isValidCaseLine: Bool {
//        hasPrefix("case ") &&
//            wordCount > 1 &&
//            removing(prefix: "case ")!.isValidCaseList
//    }
//
//    /// Enum case line can have the following format, no newLines
//    /// case cat, dog, etc
//    var isValidCaseStr: Bool {
//        hasPrefix("case ") &&
//            wordCount > 1 &&
//            removing(prefix: "case ")!.isValidCaseList
//    }
//
//    /// enum case list is a comma separated list of words starting with a letter
//    var isValidCaseList: Bool {
//        fatalError()
//    }
//
//    var isValidCaseStr: Bool {
//
//        // or maybe just use
//        // caseName != nil
//
//        //TODO: also check that no keywords used
//        hasLettersANDNumbers && first!.isLetter
//    }
//
//    /// Strips all unnecessary Strings - to get case name
//    /// Accepted format: case cat(Cat) = "fasdsa"
//    var caseName: Str? {
//
//        // case cat | = "fasdsa"
//        // in case of a raw value
//        let beforeEquality = firstPrefix(before: "=")
//
//        // case cat | (Cat)
//        // in case of an nested value
//        let beforeBracket = beforeEquality.firstPrefix(before: "(")
//
//        // case cat | // furry animal
//        let beforeComments = beforeBracket.firstPrefix(before: "//")
//
//        return beforeComments.sth
//    }
//}

//    func take(until prefix: Str) -> Str {
//        components(separatedBy: prefix)[0]
//    }
//}
