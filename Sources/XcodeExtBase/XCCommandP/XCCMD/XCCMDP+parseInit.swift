
public extension XCCMDP {
    
    /// parses func interface and body
    func parseInitDecl(_ lines: [Str],
                       usesTabs: Bool = false,
                       tabIndent: Int = 4) -> InitDecl? {
        
//        guard let strs = lines.trim else {
//            return nil
//        }
//
//        guard let interface = parseInitInterface(strs) else {
//            return nil
//        }
        
        // detect "{ ... }" in the rest Str
        //guard let statements: [Str]
        
        // parseInitBody -
        fatalError()
    }
    
    
    /// [_ "cat: Cat", _ "dog: Dog"]
    /// If interface was found in the 
    func parseInitInterface(_ lines: [Str]) -> (InitInterface, Int)? {
        
//        guard let strs = lines.trim else {
//            return nil
//        }

        // can be empty
        //guard let args: [FuncArg]
        
        //public var optional: Bool
        
        // can be absent
        //public var access: AccessMod?
        
        // let args = parseArgs(lines)
        
        fatalError()
    }
    
    func parseAccessMod(_ line: Str) -> (AccessMod, Int)? {
        
//        guard let strs = lines.trim else {
//            return nil
//        }
        
        fatalError()
    }
}




