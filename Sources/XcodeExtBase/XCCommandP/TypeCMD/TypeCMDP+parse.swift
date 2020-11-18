


public extension TypeCMDP {
    
    /// supports parsing clas/struct/enum in one line
    /// for ex class Animal { var name: Str }
    /// of with many props, funcs - each on diff line
    func parseTypeDecl(_ lines: [Str]) -> TypeDeclP? {
        
        //let strs = lines.trim
        //TODO:
        // start with one liner
        // try with and withpout newLines, diff indentations
        
        fatalError()
    }
    
    
    /// extracts properties from lines (var / let) and uses them to generate init
    /// returns nil - if no properties were found
    func parseInitDecl(lines: [Str],
                       tabIndent: Int,
                       usesTabs: Bool) -> Str? {
        
        fatalError()
        
        //TODO:
        // dash is not parsed !
        // add var optional
        
//        guard let args = parseArgs(lines) else {
//            return nil
//        }
//        return makeInitDecl(args,
//                            optional: false,
//                            usesTabs: usesTabs,
//                            tabIndent: tabIndent)
    }
    
    
    /// extracts properties from lines (var / let) and uses them to generate init
    /// returns nil - if no properties were found
    func parseProtocolDecl(propertyLines: [Str],
                           tabIndent: Int,
                           usesTabs: Bool) -> Str? {
        
        //TODO:
        // dash is not parsed !
        // add var optional
        fatalError()
        //        guard let args = parseArgs(propertyLines) else {
        //            return nil
        //        }
        //        return ProtocolDecl(args,
        //                                optional: false,
        //                                usesTabs: usesTabs,
        //                                tabIndent: tabIndent).str
    }
}


//    func parseExt(_ lines: [Str]) -> TypeDecl? {
//
//    }
//
//    func parseStruct(_ lines: [Str]) -> TypeDecl? {
//
//    }
//
//    func parseClass(_ lines: [Str]) -> TypeDecl? {
//
//    }
//
//    func parseEnum(_ lines: [Str]) -> TypeDecl? {
//
//    }
